#!/bin/bash

package="packages/$1"
if ! [ -d $package ]; then 
  echo "package $1 doesn't exist"
  exit 1
fi


version=$(node -pe "require('./package.json').version")
if [ -n $version ]; then 
  cd $package
  git branch "release-$1" $version
else
  echo "failed to get version from package. release branch not created."
  exit 1
fi