require 'date'
require 'yaml'
require 'octokit'
require 'fileutils'
require 'choice'
require 'highline/import'

Octokit.configure do |c|
  c.login = ENV['GITHUB_USER']
  c.password = ENV['GITHUB_PASS']
end

module Elyan

  VERSION=0.1

  def open_config_file(file)
    YAML.load(IO.read(file))
  end

  def pr_list_for_repo(repo)
    prs=Octokit.pull_requests(repo, :state => 'open')
    prs.each { |pr| pr[:comments]=get_pr_comments(repo, pr[:number]) }
    prs
  end

  def get_pr_comments(repo, pr_number)
    o=Octokit::Client.new
    o.issue_comments(repo, pr_number)
  end

  def contains_plus_one?(comment_body)
    comment_body =~ /\+1/
  end

  def non_author_comments(pr)
    pr[:comments].collect { |c| c unless pr[:user][:login] == c[:user][:login] }.compact
  end

  def reviews(pr)
    non_author_comments(pr).collect { |comment| comment if contains_plus_one?(comment[:body]) }.compact
  end

  def collect_merge_candidates
    mylogger = Logger['mylog']
    merge_candidates={}
    Config[:repos].each do |repo|
      mylogger.debug "\tREPO: #{repo} Getting PR List"
      pr_list = pr_list_for_repo(repo)
      mylogger.debug "\tREPO: #{repo} #{pr_list.length} Open Pull Requests"

      merge_candidates[repo]=[]
      pr_list.each do |pr|

        pr[:non_author_comments] = non_author_comments(pr)
        pr[:reviews] = reviews(pr)
        reviewers = pr[:reviews].collect { |r| r[:user][:login] }
        mylogger.debug "\t\tPR ##{pr[:number]} total comments: [#{pr[:comments].length}]"
        mylogger.debug "\t\tPR ##{pr[:number]} non_author_comments: [#{pr[:non_author_comments].length}]"
        mylogger.debug "\t\tPR ##{pr[:number]} code reviews: [#{pr[:reviews].length}] #{reviewers.join(",")}"

        if pr[:reviews].length >= Config[:minimum_reviewers]
          mylogger.debug "\t\tMERGE Candidate"

          merge_candidates[repo].push(pr)
        else
          mylogger.debug "\t\tSKIP"
        end
      end
    end
    merge_candidates
  end


  class GitWorker
    TMP_DIR='/var/tmp/build'

    def self.run_build_step(name, command)
      mylogger = Logger['mylog']
      output = `#{command}`
      unless $? == 0
        mylogger.debug "[ #{name} ] [ERROR] \"#{command}\" Failed #{output}"
        #set build status
        return false
      else
        mylogger.debug "[ #{name} ] [OK] \"#{command}\""
        return true
      end
    end

    def self.start
      mylogger = Logger['mylog']
      ratelimit = Octokit.ratelimit
      ratelimit_remaining = Octokit.ratelimit.remaining

      mylogger.debug "STATS: Rate Limit Remaining: #{ratelimit_remaining} / #{ratelimit}"
      mylogger.debug "CONFIG: Loading"
      mylogger.debug "CONFIG: #{Config.to_json}"
      mylogger.debug "CONFIG: #{Config[:repos].length} repos loaded"

      data = {}
      mylogger.debug "Collecting Merge Candidates"
      merge_candidates=collect_merge_candidates
      # p merge_candidates
      mylogger.debug "Processing Merge Candidates"
      mylogger.debug "Setting tmp_dir at #{TMP_DIR}"
      FileUtils.mkdir_p(TMP_DIR)

      merge_candidates.each do |repo, pr_list|
        pr_list.each do |pr|
          mylogger.debug "PR ##{pr[:number]} BEGIN"
          build_dir = File.join(TMP_DIR, "#{repo.gsub(/\//, '_')}_#{pr[:number].to_s}")
          mylogger.debug "Cleaning build dir #{build_dir}"
          FileUtils.rm_rf(build_dir)

          next unless run_build_step("CLONE", "git clone -q git@github.com:#{repo} #{build_dir}")
          # TRY MERGE
          next unless run_build_step("MASTER","cd #{build_dir} && git checkout -q master")
          next unless run_build_step("BRANCH","cd #{build_dir} && git checkout -q -b integration_branch_#{pr.head.ref}")
          next unless run_build_step("MERGE","cd #{build_dir} && git rebase --verbose #{pr.head.sha}")

          # try BUILD
          next unless run_build_step("BUILD","cd #{build_dir} && make build")
          # try TEST
          next unless run_build_step("TEST","cd #{build_dir} && make test")
          mylogger.debug "OK Merge, Build, Test phases successful."

          mylogger.debug "MERGING Pull Request (#{repo}, #{pr[:number]}, commit_message = 'Robot Merge OK'"
          unless Choice[:non_interactive]
            unless (ask("[INTERACTIVE MODE] : MERGING Pull Request #{repo} PR ##{pr[:number]} \"#{pr[:title]}\" OK? (y/n)") == "y")
              say "OK, Safely exiting without merging"
              next
            end
          end
          begin
            Octokit.merge_pull_request(repo, pr[:number], commit_message = 'Robot Merge OK', options = {})
          rescue => e
            mylogger.debug "PR ##{pr[:number]} Merge FAILED"
            next
          end
          mylogger.debug "PR ##{pr[:number]} Merge OK"
          mylogger.debug "PR ##{pr[:number]} END"
        end
      end

    end
  end
end

