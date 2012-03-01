#!/bin/bash

compiler=$1
clang="clang"
gcc="gcc"
gplusplus="gplus"
cc="cc"
filename=$2
filecc=".cc"
filenamecc=$filename$filecc
run=$3

if [ "$compiler"  = "$clang" ];then
  clang++ -o $filename $filenamecc
else
  if [ "$compiler" = "$gcc" ] ; then
     gcc -o $filename -m64 $filenamecc -lstdc++
  else
     if [ "$compiler" = "$gplus" ]; then
        g++ -o $filename $filenamecc
     else
       if [ "$compiler" = "$cc" ]; then
          cc -o $filename -m64 $filenamecc -lstdc++
       fi
     fi
  fi
fi

if [ $run -eq 1 ]; then
./$filename
fi
