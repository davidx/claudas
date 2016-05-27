# Elyan  son of Bors

# Story

Once upon a time..

# Goals

 

 ```
 the desired workflow is this:
  - pr comes in
  - if pr is reviewed by at least 2 people that aren't the author, the system picks it up
  - system creates an integration branch, does a rebase of the pr branch onto the target, if fails, marks the build as failed, updates gh with status
  - system builds the branch, if fails, same as above
  - system runs the (e)unit tests, if fails, same as above
  - if good, system merges integration branch to target branch, updates and closes pr

```

