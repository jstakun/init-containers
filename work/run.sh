#!/bin/sh
echo "Started";

cp -v -R /src/* /dest/

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

echo "Done";
