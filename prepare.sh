#!/bin/sh

if [ -z $1 ]; then
    git clone https://github.com/openssl/openssl.git ./openssl
    pushd ./openssl
    #git checkout f70425d3ac5e4ef17cfa116d99f8f03bbac1c7f2
    git checkout OpenSSL_1_1_1c
    ./config && make
    popd

    pushd lib
    make clean
    make
    popd

elif [ $1 = "aws" ]; then
    if [ -z `which docker` ]; then
        echo "docker must be installed"
        exit 1
    fi
    cd ami-docker
    cp -RP ../lib volume/
    bash ami-docker.sh start
    cp volume/lib/libbbcsig.so .
    cp volume/lib/libbbcsig.a .
    cp volume/lib/libbbcsig.h .
    exit
fi
