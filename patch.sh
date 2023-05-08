#!/usr/bin/env sh

# To create a patch for this:

# cp -a the directory you want to modify to "new" (on the same level as the directory you're changing)
# cd [new]
# make your changes
# cd to original directory
# diff -ruN . ../new > PATCHFILE

apply_patch()
{
    echo Applying patch: $2 to $1
    patch -s -p0 -d ~/.config/emacs/$1 < ~/.config/doom/patches/$2
}

apply_patch modules/tools/magit patch-magit-transient
