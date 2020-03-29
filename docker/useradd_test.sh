#!/bin/bash

# script used to add a new user in the Docker container instance;
# the user 'test' is needed because installing the perl-io-stty
# package requires non-root users to be installed;
# we need stty to control the settings of /dev/ttyUSB0 which is
# used by the sniffer to send serial jam signals to the jammer

# password will be 'test'
useradd -m -p $(openssl passwd -1 test) test
ln -s /usr/bin/vim /usr/bin/vi

# here give ALL permissions to user 'test' just like for 'root'
visudo
git clone https://aur.archlinux.org/perl-io-stty.git /home/test/perl-io-stty
chown -R test:test /home/test/perl-io-stty

cd /home/test/perl-io-stty

su test

# after 'su test' execute manually the following:
# makepkg -si
# exit
# stty -F /dev/ttyUSB0 9600
