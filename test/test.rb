require 'dust'
$:.unshift(File.join(File.dirname(__FILE__),'/../lib'))
require 'elyan'
include Elyan

SAMPLE_CONFIG_FILE = File.join( File.dirname(__FILE__), '/data/sample_config.yml' )

unit_tests do

  test "can open config file" do
    assert respond_to?(:open_config_file)
    config_hash = open_config_file(SAMPLE_CONFIG_FILE)
    assert config_hash.kind_of?(Hash)
    assert config_hash.key?('repos'), config_hash.inspect
    assert config_hash['repos'].include?('basho/riak'), config_hash.inspect
  end

  test "can get list of PRs for repo" do
    config_hash = open_config_file(SAMPLE_CONFIG_FILE)
    sample_repo = config_hash['repos'].first
    assert respond_to?(:pr_list_for_repo)
    pr_list = pr_list_for_repo(sample_repo)
    assert pr_list.kind_of?(Array)
    assert pr_list.length > 0
  end

  test "can detect new PR" do

  end

  test "can determine how many reviewers a PR has"  do
  end

  test "can ensure 2 or more reviewers on a PR"  do
  end

  test "can ensure author isnt one of 2 reviewers on a PR"  do
  end

  test "can create an integration branch" do
  end

  test "can do a rebase of PR branch onto target" do
  end

  test "can determine success of rebase"  do
  end

  test "can set rebase success status and update github" do
  end

  test "can build branch and set success-fail status and update github" do
  end

  test "can run the unit tests and set success status and update github" do
  end

  test "can try to merge branch" do

  end

  test "can update PR" do

  end

  test "can close PR" do
  end

end
