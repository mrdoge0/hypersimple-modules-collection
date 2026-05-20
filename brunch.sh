#!/bin/env bash

mkdir ./OUT

build_module() {
  [ ! -d "./${1}" ] && echo 'this module isnt present on the repo' && exit 1
  rm -rf ./w || true
  mkdir ./w
  cp -r ./TEMPLATE/* ./w/
  [ -f "./${1}/customize.sh" ] && rm -rf ./w/customize.sh
  cp -r ./${1}/* ./w/
  cd ./w
  zip -r ../OUT/${1}.zip *
  cd ..
  rm -rf ./w
}

if [ -z "${1}" ]; then
  for MOD in 'apk-liberator' 'expressive' 'fix-gsi-identity-crisis' 'ndot-teto' 'nuke-blurs' 'optimize-sf' 'skiavk' 'unspoof-my-lineage'; do
    build_module ${MOD}
  done
else
  build_module ${1}
fi

exit 0
