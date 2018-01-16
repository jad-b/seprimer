#!/bin/bash -eu
set -o pipefail

# Change to gh-pages branch
git checkout gh-pages

# Update from master
git rebase master

# Build site
mdbook build

# Move files to top-level directory
mv book/* . && rm -r book
git add .
git commit -m "Build book."

# Update remote
git push origin gh-pages

# Change back to master
git checkout master
