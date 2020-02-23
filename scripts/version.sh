#!/bin/bash

package="packages/$1"
if ! [ -d $package ]; then 
  echo "package $1 doesn't exist"
  exit 1
fi

if ! [[ $2 != "major" || $2 != "minor" || $2 != "patch" ]]; then
  echo "need to provide major minor patch as argument"
  exit 1
fi

cd $package && npm version $2