#!/bin/bash
set -e 

package="packages/$1"
tag=$2
confirmation=$3

if ! [[ $confirmation == "confirm" ]]; then
  echo "are you sure you want to create a new release cut?"
  echo "if so, run this command again with --confirm as the last argument"
  exit 1
fi

if ! [ -d $package ]; then 
  echo "package $1 doesn't exist"
  exit 1
fi

# create release branch
cd $package
set +e
branch_exists=$(git show-ref --verify --quiet "refs/heads/release-$1")
if [[ $branch_exists -eq 0 ]]; then 
  git branch -D "release-$1"
fi
set -e
git checkout -b "release-$1" $tag &&
git push -u origin "release-$1"

# increment develop branch
git checkout develop &&
git pull &&
npm version minor &&
git add package.json package-lock.json &&
version=$(node -pe "require('./package.json').version") &&
git commit -m "$package: ci release-cut develop@$version core-release@$tag" &&
git push -u origin develop
git tag "$1-$version"
git push --tags

