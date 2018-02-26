#
# pullFromAll.sh is a simple script that synchronizes every repository in the directory it's located by pulling from all of them.
# Author: Mustafa Ozcelikors, <mozcelikors@gmail.com>
#
# Distributed with GPLv3, see LICENSE that comes with it.
#
# Example Directory Hierarchy:
#
# MyRepositories
# |
# |_ pullFromAll.sh
# |_ repo1/
# |_ repo2/
# |_ ...
#
# How to Use:
#   copy the file, make it executable with chmod +x pullFromAll.sh, call with bash pullFromAll.sh
#

#!/bin/bash

## Get which directory where the script is located
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

export YOUR_TOP_LEVEL_FOLDER=$DIR 

for dir in `ls $YOUR_TOP_LEVEL_FOLDER`;
do
    cd $YOUR_TOP_LEVEL_FOLDER/$dir && git pull;
    cd $YOUR_TOP_LEVEL_FOLDER;
done
