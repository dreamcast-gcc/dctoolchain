export DCDEV=$(pwd)/dreamcastdev
export PATH=$PATH:$DCDEV/bin

## If specific steps were requested...
if [ $1 ]; then
  ## Run the requested build scripts.
  ./toolchain.sh $@
else
  ## Run the all build scripts.
  ./toolchain.sh
fi
