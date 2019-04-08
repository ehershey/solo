#!/bin/bash

./main

while [ $? == 100 ] ; do
    echo "Restarting software authenticator."
    ./main
done
