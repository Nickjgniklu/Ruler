here are some commands to get ther server up faster. I plan to make a bashscript to do this later
get the computers ip adress so we may put it into the settings file. 
ifconfig | grep -A1 wlp2s0 | grep -Po '(?<=inet)\W*\K[^ ]*'
