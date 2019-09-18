#!/bin/bash -e

# clones all reps depending on $baseBranch
# parameter: $baseBranch


# clone droolsjbpm-build-bootstrap
git clone git@github.com:$organization/droolsjbpm-build-bootstrap.git --branch $baseBranch --depth 70

# clone rest of the repos
./droolsjbpm-build-bootstrap/script/git-clone-others.sh --branch $baseBranch --depth 70