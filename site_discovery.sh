#!/bin/bash

script_prep()
{
  ver="0.3.6"
  binary="https://github.com/rverton/webanalyze/releases/download/v$ver/webanalyze_"$ver"_`uname`_`uname -m`.tar.gz"

  mkdir $directory
  cd $directory
  wget $binary
  tar xzvf webanalyze_0.3.6_Darwin_x86_64.tar.gz

}

directory="webanalyze"
if [ -d "$directory" ] ; then
  cd $directory
  ./webanalyze -update
else
script_prep
fi

if [ -z $1 ]
    then
    echo "No site provided"
    else
        ./webanalyze -host $1 --crawl 1 -silent -redirect --output csv
fi
