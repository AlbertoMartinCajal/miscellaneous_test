#!/bin/bash

yes | sudo pip install --upgrade pip
yes | sudo pip install flawfinder

sudo apt-get update -y
sudo apt-get install -ybuild-essential
sudo apt-get install -y libpng-dev
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y cppcheck 

#wget http://downloads.sourceforge.net/ltp/lcov-1.11.tar.gz;
#tar xvfz lcov-1.11.tar.gz;
#make install -C lcov-1.11;
