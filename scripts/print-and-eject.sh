#!/bin/bash

# Change directory to script/ directory
cd ${0%/*}
cd ..

# Turn off 'Presenter Loop'
./bin/ttputil set-param 9 0 /dev/usb/lp0

make story > /dev/usb/lp0
./bin/ttputil cut-eject /dev/usb/lp0
