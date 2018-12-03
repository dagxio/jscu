#!/bin/bash

NPMDIRS=`find ./packages -maxdepth 2 -type f -name "package.json" | sed "s/\(\.\/.*\)\/package.json/\1/g"`

for DIR in ${NPMDIRS}; do
  echo -e "\n-- ${DIR} --"
  cd ${DIR}
  ../../node_modules/.bin/can-npm-publish --vorbose
  if [[ $? = 0 ]]; then
    echo "Publish updated package"
    npm publish
  else
    echo "No need to update"
  fi
  cd ../
done