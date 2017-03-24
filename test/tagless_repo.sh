#!/bin/bash

hg init "$1"
ln -s "$1" "$1 symlink"
cd "$1"

touch "clean_file"
hg add "clean_file"
hg commit -m "Commit 1" -u "Tester <test@test.com>"
hg prev
