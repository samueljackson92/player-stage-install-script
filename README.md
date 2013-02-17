Player/Stage Install Script
===========================
A couple of bash scripts to automate the installation process of Player 3.0.2 and Stage 4.0.0 for Ubuntu. These scripts
will automatically update bashrc with correct paths as well as downloading, compiling and installing Player and Stage from
source.

Theoretically, this script should work with Ubuntu from 11.10+. I've tested it on a fresh install of Ubuntu 12.04 64 bit in a VM
and it seems to work fine. I'm unsure if it will work with versions of Ubuntu below 11.10.

Pre-Install
-----------
Before installing Player/Stage, ensure that all other versions of Player/Stage have been removed from the machine.
If compiled from source this can be done by entering into the directory where Player or Stage was built and running:

```bash
$ sudo make uninstall
```

Also check that any old files relating to Player or Stage have been removed from both ```/usr/local/lib``` and ```/usr/local/lib64``` in
case this mucks with the paths.

Installing Player/Stage
-----------------------
First, either clone the git repo or download a tarball/zip file containing the files and extract them. Then ```cd``` into the
directory. Change the two scripts to have executable permissions using the following command:

```bash
$ chmod +x update-bashrc.sh player-stage-install.sh
```

Next, run update-bashrc.sh. This adds the path variables stored in path.txt to the bashrc. It's important to do this
so that Player/Stage can find each other correctly.

```bash
$ ./update-bashrc.sh
```

Finally, run the player-stage-install.sh script to download, compile and install Player/Stage. The script should
get all of the required dependancies if they are not already installed on the system. It will then create a folder called
src in the home directory where Player/Stage will be downloaded, complied and installed to the system. Run it with the
following.

```bash
$ ./player-stage-install.sh
```
If all works as intended, Player/Stage should then be correctly setup for us with CS264's assignment files.


