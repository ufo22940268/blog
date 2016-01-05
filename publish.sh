#! /bin/sh
#
# publish.sh
# Copyright (C) 2016 cc <cc@iMac.local>
#
# Distributed under terms of the MIT license.
#


set -e

git add -A .
git commit -m "up"

hexo generate
hexo deploy
