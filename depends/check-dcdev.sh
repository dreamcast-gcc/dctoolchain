#!/bin/sh
# check-pspdev.sh by Naomi Peori (naomi@peori.ca)

## Check if $DCDEV is set.
if test ! $DCDEV; then { echo "ERROR: Set \$DCDEV before continuing."; exit 1; } fi

## Check for the $DCDEV directory.
ls -ld $DCDEV > /dev/null 2>&1 || mkdir -p $DCDEV > /dev/null 2>&1 || { echo "ERROR: Create $DCDEV before continuing."; exit 1; }

## Check for write permission.
touch $DCDEV/test.tmp > /dev/null 2>&1 || { echo "ERROR: Grant write permissions for $DCDEV before continuing."; exit 1; }

## Check for $DCDEV/bin in the path.
echo $PATH | grep $DCDEV/bin > /dev/null 2>&1 || { echo "ERROR: Add $DCDEV/bin to your path before continuing."; exit 1; }

