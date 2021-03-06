#!/bin/bash

header_paths=(
    "/usr/include" \
    "/usr/local/include" \
    "/opt/include" \
    "/opt/local/include" \
    "/usr/include/$(uname -m)-linux-gnu" \
    "/usr/local/include/$(uname -m)-linux-gnu" \
    "/usr/include/i386-linux-gnu" \
    "/usr/local/include/i386-linux-gnu" \
    "/mingw32/include/"
    # -- Add more locations here --
)

missing_depends=()

function check_header
{
    for place in ${header_paths[@]}; do
        for name in ${@:2}; do
            [ -f "$place/$name" ] && return 0
        done
    done
    
    missing_depends+=($1); return 1
}

function check_header_nosys
{
    for place in ${header_paths[@]}; do
        if [ "${place:0:12}" != "/usr/include" ]; then
            for name in ${@:2}; do
                [ -f "$place/$name" ] && return 0
            done
        fi
    done

    missing_depends+=($1); return 1
}

function check_program
{
    binary=${2:-$1}
    for place in ${PATH//:/ }; do
        [ -x "$place/$binary" ] || [ -x "$place/$binary.exe" ] && return 0
    done
    
    missing_depends+=($1); return 1
}

# macOS catalina does not ship headers in default directory anymore
if [ "$(uname)" == "Darwin" ]; then
  header_paths+=("`xcrun --show-sdk-path`/usr/include")
fi

OSVER=$(uname)
if [ ${OSVER:0:5} == Linux ]; then
check_header    ncurses         ncurses.h ncurses/ncurses.h
fi

check_program   git

check_program   make
check_program   gcc
check_program   g++

check_program   bison
check_program   flex

if [ -n "$(uname -a | grep Fedora)" ]; then
    check_program   cmp
fi

if [ ${#missing_depends[@]} -ne 0 ]; then
    echo "Couldn't find dependencies:"
    for dep in "${missing_depends[@]}"; do
        echo "  - $dep"
    done
	exit 1
fi
