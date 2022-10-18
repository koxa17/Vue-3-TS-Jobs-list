#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'Deploy'
git push -f git@github.com:koxa17/Vue-3-TS-Jobs-list.git main:gh-pages

cd -