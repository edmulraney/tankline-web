#!/bin/bash

package="packages/$1"
if [ -d $package ]; then
  npm install --prefix $package
else
  echo "package $1 doesn't exist"
  exit 1
fi