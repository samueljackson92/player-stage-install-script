#!/bin/bash

#update bashrc file
paths=`cat paths.txt`
echo "Updating bashrc file..."
echo "$paths" >> ~/.bashrc
exec bash