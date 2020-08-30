#!/usr/bin/env bash

# decompressing the tar file
tar -zxf NthPrime.tgz

# combining the .c files
cd NthPrime
gcc -c main.c nth_prime.c
gcc main.o nth_prime.o -o NthPrime
./NthPrime $1
