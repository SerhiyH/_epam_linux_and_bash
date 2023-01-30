#!/bin/bash

# C. Create a data backup script that takes the following data as parameters:
# 1. Path to the syncing directory.
# 2. The path to the directory where the copies of the files will be stored.

# Check to make sure the user has entered exactly two arguments.
if [ $# -ne 2 ]
then
    echo "Usage: data_backup.01.sh <source_directory> <target_directory>"
    echo "Please try again."
    exit 1
fi

# Check to see if rsync is installed.

if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsync to be installed."
    echo "Pleas user your disribution's package manager to install it and try again."
    exit 2
fi

# Capture the backup date, and store it in the format
# YYYY-MM-DD
backup_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir $2/$backup_date --delete"

$(which rsync) $rsync_options $1 $2/backup >> backup_$backup_date.log