#!/bin/bash -e

# upgrades the version to the release/tag version
# parameters: $kieVersion $uberfireVersion
./droolsjbpm-build-bootstrap/script/release/update-version-all.sh $kieVersion $uberfireVersion custom


#droolsjbpm-build-bootstrap
cd droolsjbpm-build-bootstrap/
sed -i "s/<latestReleasedVersionFromThisBranch>.*.<\/latestReleasedVersionFromThisBranch>/<latestReleasedVersionFromThisBranch>$kieVersion<\/latestReleasedVersionFromThisBranch>/" pom.xml
cd ..

# git add and commit the version update changes
./droolsjbpm-build-bootstrap/script/git-all.sh add .
commitMsg="Upgraded versions for release $kieVersion"
./droolsjbpm-build-bootstrap/script/git-all.sh commit -m "$commitMsg"