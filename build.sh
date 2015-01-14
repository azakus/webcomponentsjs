#!/bin/bash

# Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
# This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
# The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
# The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
# Code distributed by Google as part of the polymer project is also
# subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

npm install
gulp release
lasttag=`git rev-list --tags --max-count=1`
git co ${lasttag}
git merge -s ours master --no-commit
find . -maxdepth 1 -not -name "dist" -not -name ".git" -not -name "node_modules" -delete
mv dist/* .
rmdir dist
echo "node_modules" > .git/info/exclude
git add -A
