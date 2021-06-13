#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper

echo
echo "Issue Build Commands"
echo

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/home/darkidz/linux-x86/clang-r416183b/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/darkidz/android-ndk-r18b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out kirisakura_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j4
