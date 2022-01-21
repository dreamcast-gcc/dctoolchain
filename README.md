# dctoolchain

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/dreamcast-gcc/dctoolchain/CI?label=CI&logo=github&style=for-the-badge)](https://github.com/dreamcast-gcc/dctoolchain/actions?query=workflow%3ACI)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/dreamcast-gcc/dctoolchain/CI-Docker?label=CI-Docker&logo=github&style=for-the-badge)](https://github.com/dreamcast-gcc/pdctoolchain/actions?query=workflow%3ACI-Docker)

This program will automatically build and install a compiler and other tools used in the creation of homebrew software for the Sega Dreamcast.

## **ATTENTION!**

If you're trying to install in your machine the **WHOLE Dreamcast Development Environment** this is **NOT** the repo to use, you should use instead the [dcdev](https://github.com/dreamcast-gcc/dcdev "dcdev") repo.

## What these scripts do

These scripts download (`git clone`) and install:

-   [binutils](https://github.com/dreamcast-gcc/binutils-gdb "binutils")
-   [gdb](https://github.com/dreamcast-gcc/binutils-gdb "gdb")
-   [gcc](https://github.com/dreamcast-gcc/gcc "gcc")
-   [newlib](https://github.com/dreamcast-gcc/newlib "newlib")

## Requirements

1.  Install gcc/clang, make, cmake, patch, git, texinfo, flex, bison, gettext, wget, gsl, gmp, mpfr, mpc, readline, libarchive, gpgme, bash, openssl and libtool if you don't have those.
We offer a script to help you for installing dependencies:

### Ubuntu/Debian
```bash
sudo ./prepare-debian-ubuntu.sh
```

### Fedora
```bash
sudo ./prepare-fedora.sh
```

### OSX
```bash
sudo ./prepare-mac-os.sh
```
[MacPorts]: http://www.macports.org/
[HomeBrew]: http://brew.sh/

2.  Ensure that you have enough permissions for managing DCDEV location (default to `/opt/toolchains/dc`, but you can use a different path). DCDEV location MUST NOT have spaces or special characters in its path! DCDEV should be an absolute path. On Unix systems, if the command `mkdir -p $DCDEV` fails for you, you can set access for the current user by running commands:
```bash
export DCDEV=/opt/toolchains/dc
sudo mkdir -p $DCDEV
sudo chown -R $USER: $DCDEV
```

3.  Add this to your login script (example: `~/.bash_profile`)
    **Note:** Ensure that you have full access to the DCDEV path. You can change the DCDEV path with the following requirements: only use absolute paths, don't use spaces, only use Latin characters.
```bash
export DCDEV=/opt/toolchains/dc
export PATH=$PATH:$DCDEV/bin
```

4.  Run toolchain.sh
```bash
./toolchain.sh
```

## Thanks
