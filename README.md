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
Davids-MacBook-Pro:elyan davidx$ elyan -d 
[INFO] 2016-08-03 10:42:51 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:42:51 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:42:51 :Elyan: DO NOT USE ON LIVE REPO!!. IT WILL MERGE YOUR PETS WITHOUT ASKING
[INFO] 2016-08-03 10:42:51 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:42:51 :Elyan: WARNING!!!
[DEBUG] 2016-08-03 10:42:52 :Elyan: STATS: Rate Limit Remaining: 4979 / #<struct Octokit::RateLimit limit=5000, remaining=4979, resets_at=2016-08-03 11:10:57 -0700, resets_in=1684>
[DEBUG] 2016-08-03 10:42:52 :Elyan: CONFIG: Loading
[DEBUG] 2016-08-03 10:42:52 :Elyan: CONFIG: {"repos":["davidx/prtester","basho-bin/basho-builds"],"minimum_reviewers":2}
[DEBUG] 2016-08-03 10:42:52 :Elyan: CONFIG: 2 repos loaded
[DEBUG] 2016-08-03 10:42:52 :Elyan: Setting tmp_dir at /var/tmp/build
[DEBUG] 2016-08-03 10:42:52 :Elyan: Collecting Merge Candidates
[DEBUG] 2016-08-03 10:42:52 :Elyan: REPO: davidx/prtester Getting PR List
[DEBUG] 2016-08-03 10:42:55 :Elyan: REPO: davidx/prtester 4 Open Pull Requests
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #21 total comments: [1]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #21 non_author_comments: [1]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #21 code reviews: [1] davidpuddy1
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #21  SKIP
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #20 total comments: [2]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #20 non_author_comments: [2]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #20 code reviews: [2] davidpuddy1,davidx
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #20  MERGE Candidate
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #17 total comments: [3]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #17 non_author_comments: [2]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #17 code reviews: [2] davidpuddy1,bobsmith1
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #17  MERGE Candidate
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #10 total comments: [2]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #10 non_author_comments: [2]
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #10 code reviews: [2] davidx,bobsmith1
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #10  MERGE Candidate
[DEBUG] 2016-08-03 10:42:55 :Elyan: PR #20 BEGIN
[DEBUG] 2016-08-03 10:42:55 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_20
"Updating b9952fa..7e35398\nFast-forward (no commit created; -m option ignored)\n testfile1 | 1 +\n 1 file changed, 1 insertion(+)"
[DEBUG] 2016-08-03 10:42:58 :Elyan: [ BUILD ] [OK] "make build"
[DEBUG] 2016-08-03 10:42:58 :Elyan: [ TEST ] [OK] "make test"
[DEBUG] 2016-08-03 10:42:58 :Elyan: [MERGE,BUILD,TEST] Successful.
[INTERACTIVE MODE] : MERGING Pull Request davidx/prtester PR #20 "testing merges and reviews" OK? (y/n)
n
OK, Safely exiting without merging
[DEBUG] 2016-08-03 10:43:01 :Elyan: PR #17 BEGIN
[DEBUG] 2016-08-03 10:43:01 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_17
[ERROR] 2016-08-03 10:43:07 :Elyan: Merge Failed, Stopping
[DEBUG] 2016-08-03 10:43:07 :Elyan: PR #17 END
[DEBUG] 2016-08-03 10:43:07 :Elyan: PR #10 BEGIN
[DEBUG] 2016-08-03 10:43:07 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_10
[ERROR] 2016-08-03 10:43:09 :Elyan: Merge Failed, Stopping
[DEBUG] 2016-08-03 10:43:09 :Elyan: PR #10 END
[DEBUG] 2016-08-03 10:43:09 :Elyan: REPO: basho-bin/basho-builds Getting PR List
[DEBUG] 2016-08-03 10:43:11 :Elyan: REPO: basho-bin/basho-builds 1 Open Pull Requests
[DEBUG] 2016-08-03 10:43:11 :Elyan: PR #10 total comments: [0]
[DEBUG] 2016-08-03 10:43:11 :Elyan: PR #10 non_author_comments: [0]
[DEBUG] 2016-08-03 10:43:11 :Elyan: PR #10 code reviews: [0] 
[DEBUG] 2016-08-03 10:43:11 :Elyan: PR #10  SKIP
build report
---
davidx/prtester:
- :pr:
    :title: testing merges and reviews
    :id: 79947918
  :started_at: !ruby/object:DateTime 2016-08-03 10:42:55.453274000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_20"
  :result: :ok
- :pr:
    :title: test
    :id: 79848766
  :started_at: !ruby/object:DateTime 2016-08-03 10:43:01.890101000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_17"
  :result: :error
  :message: Merge test failed
- :pr:
    :title: New feature 1470175989 Unmergable
    :id: 79818958
  :started_at: !ruby/object:DateTime 2016-08-03 10:43:07.911620000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_10"
  :result: :error
  :message: Merge test failed
basho-bin/basho-builds: []

Davids-MacBook-Pro:elyan davidx$ elyan -d -n
[INFO] 2016-08-03 10:43:38 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:43:38 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:43:38 :Elyan: DO NOT USE ON LIVE REPO!!. IT WILL MERGE YOUR PETS WITHOUT ASKING
[INFO] 2016-08-03 10:43:38 :Elyan: WARNING!!!
[INFO] 2016-08-03 10:43:38 :Elyan: WARNING!!!
[DEBUG] 2016-08-03 10:43:39 :Elyan: STATS: Rate Limit Remaining: 4972 / #<struct Octokit::RateLimit limit=5000, remaining=4972, resets_at=2016-08-03 11:10:57 -0700, resets_in=1637>
[DEBUG] 2016-08-03 10:43:39 :Elyan: CONFIG: Loading
[DEBUG] 2016-08-03 10:43:39 :Elyan: CONFIG: {"repos":["davidx/prtester","basho-bin/basho-builds"],"minimum_reviewers":2}
[DEBUG] 2016-08-03 10:43:39 :Elyan: CONFIG: 2 repos loaded
[DEBUG] 2016-08-03 10:43:39 :Elyan: Setting tmp_dir at /var/tmp/build
[DEBUG] 2016-08-03 10:43:39 :Elyan: Collecting Merge Candidates
[DEBUG] 2016-08-03 10:43:39 :Elyan: REPO: davidx/prtester Getting PR List
[DEBUG] 2016-08-03 10:43:41 :Elyan: REPO: davidx/prtester 4 Open Pull Requests
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #21 total comments: [1]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #21 non_author_comments: [1]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #21 code reviews: [1] davidpuddy1
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #21  SKIP
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #20 total comments: [2]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #20 non_author_comments: [2]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #20 code reviews: [2] davidpuddy1,davidx
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #20  MERGE Candidate
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #17 total comments: [3]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #17 non_author_comments: [2]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #17 code reviews: [2] davidpuddy1,bobsmith1
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #17  MERGE Candidate
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #10 total comments: [2]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #10 non_author_comments: [2]
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #10 code reviews: [2] davidx,bobsmith1
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #10  MERGE Candidate
[DEBUG] 2016-08-03 10:43:41 :Elyan: PR #20 BEGIN
[DEBUG] 2016-08-03 10:43:41 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_20
"Updating b9952fa..7e35398\nFast-forward (no commit created; -m option ignored)\n testfile1 | 1 +\n 1 file changed, 1 insertion(+)"
[DEBUG] 2016-08-03 10:43:44 :Elyan: [ BUILD ] [OK] "make build"
[DEBUG] 2016-08-03 10:43:44 :Elyan: [ TEST ] [OK] "make test"
[DEBUG] 2016-08-03 10:43:44 :Elyan: [MERGE,BUILD,TEST] Successful.
[DEBUG] 2016-08-03 10:43:44 :Elyan: MERGING Pull Request (davidx/prtester, 20, commit_message = 'Robot Merge OK'
[DEBUG] 2016-08-03 10:43:45 :Elyan: PR #20 Merge OK
[DEBUG] 2016-08-03 10:43:45 :Elyan: PR #20 END
[DEBUG] 2016-08-03 10:43:45 :Elyan: PR #17 BEGIN
[DEBUG] 2016-08-03 10:43:45 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_17
[ERROR] 2016-08-03 10:43:47 :Elyan: Merge Failed, Stopping
[DEBUG] 2016-08-03 10:43:47 :Elyan: PR #17 END
[DEBUG] 2016-08-03 10:43:47 :Elyan: PR #10 BEGIN
[DEBUG] 2016-08-03 10:43:47 :Elyan: Cleaning build dir /var/tmp/build/davidx_prtester_10
[ERROR] 2016-08-03 10:43:49 :Elyan: Merge Failed, Stopping
[DEBUG] 2016-08-03 10:43:49 :Elyan: PR #10 END
[DEBUG] 2016-08-03 10:43:49 :Elyan: REPO: basho-bin/basho-builds Getting PR List
[DEBUG] 2016-08-03 10:43:50 :Elyan: REPO: basho-bin/basho-builds 1 Open Pull Requests
[DEBUG] 2016-08-03 10:43:50 :Elyan: PR #10 total comments: [0]
[DEBUG] 2016-08-03 10:43:50 :Elyan: PR #10 non_author_comments: [0]
[DEBUG] 2016-08-03 10:43:50 :Elyan: PR #10 code reviews: [0] 
[DEBUG] 2016-08-03 10:43:50 :Elyan: PR #10  SKIP
build report
---
davidx/prtester:
- :pr:
    :title: testing merges and reviews
    :id: 79947918
  :started_at: !ruby/object:DateTime 2016-08-03 10:43:41.904875000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_20"
  :result: :ok
  :ended_at: !ruby/object:DateTime 2016-08-03 10:43:45.660063000 -07:00
- :pr:
    :title: test
    :id: 79848766
  :started_at: !ruby/object:DateTime 2016-08-03 10:43:45.660106000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_17"
  :result: :error
  :message: Merge test failed
- :pr:
    :title: New feature 1470175989 Unmergable
    :id: 79818958
  :started_at: !ruby/object:DateTime 2016-08-03 10:43:47.618592000 -07:00
  :build_dir: "/var/tmp/build/davidx_prtester_10"
  :result: :error
  :message: Merge test failed
basho-bin/basho-builds: []


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

