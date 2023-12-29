#!/bin/bash

echo "Cleaning broken symlinks"

echo "- Removing broken symlinks"
find ~/.ssh -xtype l -delete
find ~/.shell -xtype l -delete

echo "- Git configs"
git config --global --unset include.path
