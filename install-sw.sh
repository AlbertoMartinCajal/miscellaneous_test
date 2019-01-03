#!/bin/bash

sudo pip install --upgrade pip
sudo pip install flawfinder
sudo apt-get install gdb
sudo apt-get install libpng-dev
sudo apt-get install zlib1g-dev
sudo apt-get install cppcheck
wget http://downloads.sourceforge.net/ltp/lcov-1.11.tar.gz;
tar xvfz lcov-1.11.tar.gz;
make -C lcov-1.11;
