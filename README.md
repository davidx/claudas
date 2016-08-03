# A simplified integration robot
 
 
## Installation

```
> git clone https://github.com/davidx/elyan.git
> cd elyan
> rake install
```
## Test
```
> rake test
```
## Usage

```
> elyan -h 
UUsage: elyan [-cdnv]
 
 Specific options:
     -c, --config=CONFIG              The config file
 
 Common options: 
         --help                       Show this message
     -d, --debug                      Show debug (verbose)
     -n, --non-interactive            Don't require human confirmation
     -v, --version                    Show version
```
### Example runs
#### Specifying a config file

```
> elyan --config=config/elyan.yml
```
#### Debug enabled and merge without interactive prompt
```
> elyan --debug --non-interactive 

```
### Example Output
```
Davids-MacBook-Pro:elyan davidx$ elyan -h
Usage: elyan [-cdnv]

Specific options:
    -c, --config=CONFIG              The config file

Common options: 
        --help                       Show this message
    -d, --debug                      Show debug (verbose)
    -n, --non-interactive            Don't require human confirmation
    -v, --version                    Show version
Davids-MacBook-Pro:elyan davidx$ ./bin/elyan -d 
[INFO] 2016-08-03 10:56:17 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:56:17 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:56:17 :Elyan: DO NOT USE ON LIVE REPO!!. IT WILL MERGE YOUR PETS WITHOUT ASKING
[INFO] 2016-08-03 10:56:17 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:56:17 :Elyan: WARNING!!!
[DEBUG] 2016-08-03 10:56:18 :Elyan: STATS: Rate Limit Remaining: 4946 / #<struct Octokit::RateLimit limit=5000, remaining=4946, resets_at=2016-08-03 11:10:57 -0700, resets_in=878>
[DEBUG] 2016-08-03 10:56:18 :Elyan: CONFIG: Loading
[DEBUG] 2016-08-03 10:56:18 :Elyan: CONFIG: {"repos":["davidx/prtester","basho-bin/basho-builds"],"minimum_reviewers":2}
[DEBUG] 2016-08-03 10:56:18 :Elyan: CONFIG: 2 repos loaded
[DEBUG] 2016-08-03 10:56:18 :Elyan: Setting tmp_dir at /var/tmp/build
[DEBUG] 2016-08-03 10:56:18 :Elyan: Collecting Merge Candidates
[DEBUG] 2016-08-03 10:56:18 :Elyan: REPO: davidx/prtester Getting PR List
[DEBUG] 2016-08-03 10:56:20 :Elyan: REPO: davidx/prtester 3 Open Pull Requests
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #21 total comments: [1]
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #21 non_author_comments: [1]
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #21 code reviews: [1] davidpuddy1
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #21  SKIP
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #17 total comments: [3]
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #17 non_author_comments: [2]
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #17 code reviews: [2] davidpuddy1,bobsmith1
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #17  MERGE Candidate
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #10 total comments: [2]
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #10 non_author_comments: [2]
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #10 code reviews: [2] davidx,bobsmith1
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #10  MERGE Candidate
[DEBUG] 2016-08-03 10:56:20 :Elyan: PR #17 BEGIN
[DEBUG] 2016-08-03 10:56:20 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_17
[DEBUG] 2016-08-03 10:56:20 :Elyan: Cloning ("git@github.com:davidx/prtester", build_dir)
[DEBUG] 2016-08-03 10:56:22 :Elyan: Trying merge
[ERROR] 2016-08-03 10:56:22 :Elyan: Merge Failed, Stopping
[DEBUG] 2016-08-03 10:56:22 :Elyan: PR #17 END
[DEBUG] 2016-08-03 10:56:22 :Elyan: PR #10 BEGIN
[DEBUG] 2016-08-03 10:56:22 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_10
[DEBUG] 2016-08-03 10:56:22 :Elyan: Cloning ("git@github.com:davidx/prtester", build_dir)
[DEBUG] 2016-08-03 10:56:24 :Elyan: Trying merge
[ERROR] 2016-08-03 10:56:24 :Elyan: Merge Failed, Stopping
[DEBUG] 2016-08-03 10:56:24 :Elyan: PR #10 END
[DEBUG] 2016-08-03 10:56:24 :Elyan: REPO: basho-bin/basho-builds Getting PR List
[DEBUG] 2016-08-03 10:56:26 :Elyan: REPO: basho-bin/basho-builds 1 Open Pull Requests
[DEBUG] 2016-08-03 10:56:26 :Elyan: PR #10 total comments: [0]
[DEBUG] 2016-08-03 10:56:26 :Elyan: PR #10 non_author_comments: [0]
[DEBUG] 2016-08-03 10:56:26 :Elyan: PR #10 code reviews: [0] 
[DEBUG] 2016-08-03 10:56:26 :Elyan: PR #10  SKIP
build report
---
davidx/prtester:
- :pr:
    :title: test
    :id: 79848766
  :started_at: !ruby/object:DateTime 2016-08-03 10:56:20.760800000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_17"
  :result: :error
  :message: Merge test failed
  :output: |-
    #<Git::GitExecuteError: git '--git-dir=/var/tmp/build/davidx_prtester_17/.git' '--work-tree=/var/tmp/build/davidx_prtester_17' merge '-m' 'merge' 'c39615637f3489648e43b93fe9ad1f5f03dbaa5f'  2>&1:Auto-merging testfile1
    CONFLICT (content): Merge conflict in testfile1
    Automatic merge failed; fix conflicts and then commit the result.>
- :pr:
    :title: New feature 1470175989 Unmergable
    :id: 79818958
  :started_at: !ruby/object:DateTime 2016-08-03 10:56:22.276126000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_10"
  :result: :error
  :message: Merge test failed
  :output: |-
    #<Git::GitExecuteError: git '--git-dir=/var/tmp/build/davidx_prtester_10/.git' '--work-tree=/var/tmp/build/davidx_prtester_10' merge '-m' 'merge' '3324b6d75ab956a372805f842c5661b81fcf2e1b'  2>&1:Auto-merging testfile5
    CONFLICT (add/add): Merge conflict in testfile5
    Automatic merge failed; fix conflicts and then commit the result.>

```

#### Minimum requirements
 
 - **REVIEW**: When a push is made to a pull request branch, it should be evaluated against a default set of rules:
  -  IF PR is reviewed by at least 2 people that aren't the author, continue.
 - **MERGE**: An integration branch is created and a rebase is performed of the pr branch onto the target
  - IF it fails, mark the build as failed, update Github PR comment with status of failure.
 - **BUILD** the branch
  - IF it fails, mark build as failed, update Github PR comment with status of failure.
 - **TEST** the branch with unit tests.
  - IF it fails, mark the build as failed, update Github PR comment with status of failure.
 - **PASS**: Merge, Build and Tests all pass, system merges working integration branch to target branch. 
  - System updates Github PR comment with status of success and closes PR
 
 
### TODO
 - create github pr comment with status
 - implement webhooks
 - implement notifications, slack,email

## Contributing

1. Fork it ( https://github.com/davidx/elyan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

