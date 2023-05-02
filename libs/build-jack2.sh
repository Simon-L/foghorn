#! /bin/bash

echo $(pwd)
echo "Running ./waf configure --debug --prefix=$1 $2"
cd jack2
./waf configure --debug --prefix=$1 $2
./waf -j16
./waf -j16 install
