# adamhadani-rcfiles

## Overview

Various common configurations and utility scripts I use.
Feel free to use them for your own purposes.

***

## Contents

### Bash shell settings [/bash]

* **.bash_aliases** - misc. shell aliases I use often
* **.bash_profile.AmazonAWS** - Common environment setting used with the various AWS CLI tools
* **.bash_profile.MacOSX** - shell settings I use on my OSX Mac dev machine

### .rc Files and tool configuration [/config]

* **.gitconfig** - My personal Git settings (*includes my name/email in [user] settings so change if you wanna use this!*)
* **.screenrc** - My GNU screen settings
* **.vimrc** - My vim settings

### Scripts [/scripts]


* **phpref** - Quick function to (recursively) grep .php files
* **pyref** - Quick function to (recursively) grep .py files
* **rdiff** - Perform diff on a remote file using scp! see rdiff -h for usage
* **stream-lzo-hdfs** - compress a file to .lzo on the fly into HDFS location and perform indexing on it so it is splittable. requires hadoop-lzo-xxx.jar
* **setup-dev-machine.sh** - Install all packages and setup common defaults for an Ubuntu development machine, the way I use it. See script for details.