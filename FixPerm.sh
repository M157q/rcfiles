#!/usr/bin/env bash

# Fix permission and owner/group

HOME=`pwd`
DIRS=`echo $HOME`
USER=`whoami`
GROUP='users' # set to the right group name

chown -R $USER:$GROUP $DIRS
find $DIRS -type d -exec chmod 700 {} \; # set the folder default permission
find $DIRS -type f -exec chmod 600 {} \; # set the file   default permission
