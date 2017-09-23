#!/bin/sh
echo "Starting...";

if [ -z ${CONF+x} ]; then
  echo "CONF is unset. Nothing will be downloaded. I'll copy files from /src";
  cp -v -R /src/* /dest/ 
else 
  wget $CONF;
  tar -xjvf -C /dest/ *.tar.gz
fi
 
if [ -z ${PREFIX+x} ]; then 
  echo "PREFIX is unset. Please set PREFIX and retry"; 
else
  query="";
  for var in $(compgen -v | grep $PREFIX)
  do
    echo "Processing $var"
    val=${!var}
    query="$query s/$var/$val/g;"
  done;
  # find all variables with name starting with PREFIX and replace it occurences in all files in /dest directory
  if [ -z ${query+x} ]; then  
     find /dest -type f | xargs sed -i "$query"; 
  fi 
fi

echo $(cat /dest/conf/test1.txt);

echo $(cat /dest/conf/test2.txt);

echo "Done!";
