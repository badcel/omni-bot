#!/bin/sh

BASEPATH=$(pwd)

export BOOST=$BASEPATH/boost_1_81_0
export BOOST_LIB=$BASEPATH/boostbuild/lib
export BOOST_SUFFIX=

wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.bz2
tar --bzip2 -xf ./boost_1_81_0.tar.bz2

cd $BOOST

./bootstrap.sh --prefix=$BASEPATH/boostbuild --with-libraries=filesystem,regex,date_time,system

./b2 cflags=-fPIC cxxflags=-fPIC link=static install

export PATH=$BOOST_LIB:$PATH
cd $BASEPATH/0.83/Omnibot

$BOOST/b2 cflags=-fPIC cxxflags=-fPIC -a -q release
