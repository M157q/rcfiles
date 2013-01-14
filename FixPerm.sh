#!/usr/local/bin/bash

# Fix permission and owner/group                        
                                                                                
PROTECTED="/usr/home/gh40402/"                                            
DIRS=`echo $PROTECTED`                       
USER="gh40402"                                                                     
GROUP="gh40402"                                                                   
                                                                                
chown -R $USER:$GROUP $DIRS                                                     
find $DIRS -type d -exec chmod 700 {} \;                                        
find $DIRS -type f -exec chmod 600 {} \;
