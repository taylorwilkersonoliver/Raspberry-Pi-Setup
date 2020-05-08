#!/bin/bash
## Node Configuration 1.0
## By: Taylor Oliver
## Date: 2017/09/05
##
## Reason:
##    Streamlined boot for beowulf cluster nodes to be followed by post-boot scripts that load only what's necessary.
##    cat initial_setup_script.sh | cut -c1- > uncommented_initial_setup_script.sh && chmod +x uncommented_initial_setup_script.sh && ./uncommented_initial_setup_script.sh
## Metrics:
##    systemd-analyze
##        Before:
##            Startup finished in 35.150s (kernel) + 2.613s (userspace) = 37.764s
##            graphical.target reached after 2.582s in userspace
##        After:
##            Startup finished in 4.224s (kernel) + 2.789s (userspace) = 7.013s
##            graphical.target reached after 2.763s in userspace
###########
########### undo what you did
###########

# Enable ufw because we're connecting to interwebs
systemctl enable ufw.service

# Enable stunnel4.service because we want TLS for daemons
systemctl enable stunnel4.service

# Enable bluetooth.service because we want bluetooth
systemctl enable bluetooth.service

# Enable avahi-daemon.service for zero-config networking
systemctl enable avahi-daemon.service

# Enable wpa_supplicant.service because we want wifi the easy way
systemctl enable wpa_supplicant.service

# Enable NetworkManager.service because why not have a little network management too
systemctl enable NetworkManager.service

# Enable networking.service because networking is fun
systemctl enable networking.service

# Enable pppd-dns.service because we developed time travel and are going to party like it's 1999
systemctl enable pppd-dns.service

# Enable ModemManager.service because we are a cell phone.
systemctl enable ModemManager.service

# Enable rsyslog.service because we want to see what we're doing and criticize it later
#systemctl enable rsyslog.service

# Enable debugging systemd because we broke stuff (probably everything)
#systemctl enable debug-shell.service
