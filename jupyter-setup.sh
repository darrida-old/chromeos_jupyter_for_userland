#!/bin/bash
#
#Purpose of script:
#  -Built for use with UserLAnd Android app on a Chromebook
#   (probably works fine on Android)
#  -If not downloaded for this purpose, probably as a result of
#   reading the guide, please see the guid for more information:
#    -URL: https://github.com/darrida/chromeos_jupyter_for_userland
##############################################
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install openssh-server
sudo apt-get --assume-yes install python3
sudo apt-get --assume-yes remove --auto-remove python-pip
sudo apt-get --assume-yes install python3-pip
sudo python3 -m pip install --upgrade pip
sudo pip install jupyter
sudo pip install jupyterlab
sudo pip install pandas
sudo pip install bs4
sudo apt-get --assume-yes install pkg-config
sudo apt-get --assume-yes install libfreetype6-dev
sudo pip install matplotlib
echo ""
echo "JUPYTER SHOULD BE READY TO USE NOW."
echo ""
echo "The following were installed: git, openssh-server, python3, jupyter, jupyterlab, pandas, bs4, matplotlib."
##############################################
#Contact: darrida | darrida.py@gmail.com | tech.theogeek.com
