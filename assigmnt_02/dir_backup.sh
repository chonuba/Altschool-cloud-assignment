#!/bin/bash

# directory to backup; to be supplied as argument 1
srcDir=$1

# directory where the backup will be saved to be supplied as argument2
destDir=$2

# creating the backup filename to be dynamically generated.
timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
archiveName="backup-$timestamp.tar.gzip"

# backing up the directory from source directory to destination directory
sudo tar czf $destDir/$archiveName $srcDir
echo "backup successful"
