#!/bin/bash
# toolchain-sudo.sh by Naomi Peori (naomi@peori.ca)

INSTALLDIR=/opt/toolchains/dc/

## Enter the dctoolchain directory.
cd "`dirname $0`" || { echo "ERROR: Could not enter the dctoolchain directory."; exit 1; }

## Set up the environment.
export DCDEV=$INSTALLDIR
export PATH=$PATH:$DCDEV/bin

## Run the toolchain script.
./toolchain.sh $@ || { echo "ERROR: Could not run the toolchain script."; exit 1; }
