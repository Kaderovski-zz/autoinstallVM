#!/bin/sh
# Script made by Cdiez50
# This script do :
# Install Letsencrypt
#
# For my friend Julien :-)



# DO IT ONLY IF YOU HAVE SET A WEBSITE/DOMAINE NAME ON YOUR SYSTEM !!
# ---------- 
# ----------
# Installing Lets Encrypt
echo "\n \n****installing Letsencrypt...****\n"
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto
cd /
# ---------- 
# ----------
