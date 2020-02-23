#!/bin/bash

package="packages/$1"
tag=$2
confirmation=$3

if ! [[ $confirmation == "confirm" ]]; then
  echo "are you sure you want to create a new release cut? if so run this command again with --confirm as the last argument"
  exit 1
fi

if ! [ -d $package ]; then 
  echo "package $1 doesn't exist"
  exit 1
fi

cd $package
git checkout develop &&
git pull &&
npm version minor &&
git add package.json package-lock.json &&
git commit -m "$package: ci release-cut" &&
git push

git branch -d "release-$1"
git checkout -b "release-$1" $tag &&
git push -u origin "release-$1"