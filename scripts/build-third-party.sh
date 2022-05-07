#!/bin/bash

BASE_PATH=$(readlink -f $0)
BASE_DIR=$(dirname $BASE_PATH)

cd $BASE_DIR/../third_party/pear/
./build-third-party.sh
mkdir cmake
cd cmake
cmake -DENABLE_SIGNALING=on ..
make -j4

