#!/bin/bash

# Change directory to script/ directory
cd ${0%/*}
cd ..

make story > /dev/usb/lp0
./bin/ttputil cut-eject /dev/usb/lp0
