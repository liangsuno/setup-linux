#!/bin/sh

vendor_folder=`pwd`/cookbooks
workingfolder=`pwd`
rm -fr $vendor_folder
cd $workingfolder/setup-linux-global
berks vendor $vendor_folder
sudo chef-client -z -o setup-linux-global
sudo rm -fr $workingfolder/nodes

#cd $workingfolder/setup-linux-personal
#berks vendor $vendor_folder
#cd $vendor_folder
#chef-client -z -o setup-linux-personal
#rm -fr $workingfolder/nodes
