#!/bin/bash

export CROSS_COMPILE=../bin/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/bin/aarch64-linux-androidkernel-
export ARCH=arm64

if [ ! -z $USE_CCACHE  ] && [ ! -z $CCACHE_EXEC -a -x $CCACHE_EXEC ]; then
    export CROSS_COMPILE="$CCACHE_EXEC $CROSS_COMPILE"
fi

if [ ! -z $OUT_DIR ]; then
    OUT=$OUT_DIR
else
    OUT=out
fi

make O=$OUT lineageos_a3xelte_defconfig
make O=$OUT -j 8
