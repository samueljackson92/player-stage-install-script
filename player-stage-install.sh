#!/bin/bash

#version variables
stage_version="4.0.0"
player_version="3.0.2"

#load data
cmakelists=`cat CMakeLists.txt`
patch_file=`cat readlog_patch.cc`

#install dependancies
echo "Installing dependancies..."
sudo apt-get install g++ pkg-config cmake libfltk1.1 libfltk1.1-dev freeglut3 freeglut3-dev libpng12-0 libpng12-dev libtool libltdl7 libltdl-dev libboost-thread-dev libboost-signals-dev libdb5.1-stl

#make a directory to keep the source files
echo "Preparing install directory..."
mkdir ~/src
cd ~/src

#get player and stage
echo "Getting player/stage source files..."
wget http://sourceforge.net/projects/playerstage/files/Player/$player_version/player-$player_version.tar.gz
wget https://github.com/rtv/Stage/archive/v$stage_version.tar.gz

#extract them both
echo "Extracting..."
tar xvf player-$player_version.tar.gz
tar xvf v$stage_version.tar.gz

#Patching Player
echo "$patch_file" > ~/src/player-$player_version/server/drivers/shell/readlog.cc

#make player
echo "Building player..."
cd player-$player_version
mkdir build
cd build
cmake ..
sudo make install

#switch to Stage directory
cd ../..
cd Stage-$stage_version

#copy updated make file to Stage 4.*
echo "Preparing stage for install..."
echo "$cmakelists" > ~/src/Stage-$stage_version/libstage/CMakeLists.txt

#make stage
echo "Building stage..."
mkdir build
cd build
cmake ..
sudo make install

