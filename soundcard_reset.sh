#!/bin/bash

#List Cards:
#pacmd list-cards

#pavucontrol: HDMI output appears 'unplugged'
pacmd set-card-profile 0 output:hdmi-stereo
#pacmd unload-module 0 
#pacmd set-card-profile 0 output:analog-stereo
#sleep 2
#pacmd set-card-profile 0 output:hdmi-stereo
