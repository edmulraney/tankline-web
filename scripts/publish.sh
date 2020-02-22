#!/bin/bash

package="packages/$1"
if [ -d $package ]; then
  artifact=$(find $package -name "$1-*.tgz")
  if [ -z $artifact ]; then
    echo "you need to pack $1 first: npm run pack $1"
    exit 1
  fi
  npm publish $artifact
else
  echo "package $1 doesn't exist"
  exit 1
fi