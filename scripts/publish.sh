#!/bin/bash

package="packages/$1"
if [ -d $package ]; then
  cd $package && npm publish --access public
else
  echo "package $1 doesn't exist"
  exit 1
fi