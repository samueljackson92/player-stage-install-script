#!/bin/bash

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
wget http://sourceforge.net/projects/playerstage/files/Player/3.0.2/player-3.0.2.tar.gz
wget https://github.com/rtv/Stage/archive/v4.0.0.tar.gz

#extract them both
echo "Extracting..."
tar xvf player-3.0.2.tar.gz
tar xvf v4.0.0.tar.gz

#Patching Player
echo "$patch_file" > ~/src/player-3.0.2/server/drivers/shell/readlog.cc

#make player
echo "Building player..."
cd player-3.0.2
mkdir build
cd build
cmake ..
sudo make install

if [ $? -eq 0 ]
	then
	echo "Failed to build player. Quitting."
	exit
fi

#switch to Stage directory
cd ../..
cd Stage-4.0.0

#copy updated make file to Stage 4.*
echo "Preparing stage for install..."
echo "$cmakelists" > ~/src/Stage-4.0.0/libstage/CMakeLists.txt

#make stage
echo "Building stage..."
mkdir build
cd build
cmake ..
sudo make install

if [ $? -eq 0 ]
	then
	echo "Failed to build stage. Quitting."
	exit
fi

echo "Finished successfully!"