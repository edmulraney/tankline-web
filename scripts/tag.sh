#!/bin/bash

package="packages/$1"
if ! [ -d $package ]; then 
  echo "package $1 doesn't exist"
  exit 1
fi

if ! [[ $2 != "major" || $2 != "minor" || $2 != "patch" ]]; then
  echo "need to provide argument: major, minor or patch"
  exit 1
fi

cd $package && npm version $2 &&
git add package.json package-lock.json &&
git commit -m 'ci tag: patch' &&
git push
version=$(node -pe "require('./$package/package.json').version")
git tag $version
git push --tags


# latest development branch                               - develop branch
# next release branch                                     - tag rc-1.0.0
# release branch changes automerge back to develop        - checkout rc-1.0.0, change.., rc-1.0.1
# current production branch
# hotfix branch for production

# latest development branch                               - develop branch
# next release branch (created when release is needed)    - git branch release-core 1.0.0 (<- from tag)
# release branch changes automerge back to develop        - checkout release-core, make PRs, new tag 1.0.0-rc-1?, when promoted to prod - delete branch, need to tag as branch is deleted
# current production branch                               - create master from last release tag 1.0.0-rc-x
# hotfix branch for production                            - create hotfix from master