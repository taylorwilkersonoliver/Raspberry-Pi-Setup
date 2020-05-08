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
########### run prior to shutdown
###########
# Stop debug-shell.service because not debugging systemd
#systemctl stop debug-shell.service

# Stop bluetooth.service because it's not needed for shutdown
systemctl stop bluetooth.service

# Stop avahi-daemon.service because it's not needed for shutdown
systemctl stop avahi-daemon.service

# Stop wpa_supplicant.service because it's not needed for shutdown
systemctl stop wpa_supplicant.service

# Stop NetworkManager.service because it's not needed for shutdown
systemctl stop NetworkManager.service

# Stop networking.service because it's not needed for shutdown
systemctl stop networking.service

# Stop pppd-dns.service because was time travelling to 90's and it was sooo 1337
#systemctl stop pppd-dns.serviced

# Stop ModemManager.service because was being a cell phone (unless wasn't being a cell phone)
systemctl stop ModemManager.service

# Stop stunnel4.service because it's not needed for shutdown
systemctl stop stunnel4.service

# Stop ufw.service because all networking has stopped (or not...)
#systemctl stop ufw.service

# Disable hibernation and sleep because the enemy never sleeps (jk)
#sed -i "s/RESUME=UUID=/# RESUME=UUID=/g" > /etc/initramfs-tools/conf.d/resume
