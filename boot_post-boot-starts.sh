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
########### run after boot
###########
# Start rsyslog.service because doing stuff
#systemctl start rsyslog.service

# Start ufw because connecting to interwebs
systemctl start ufw.service

# Start stunnel4.service because TLS
systemctl start stunnel4.service

# Start bluetooth.service because bluetooth
systemctl start bluetooth.service

# Start avahi-daemon.service because zero-config networking
systemctl start avahi-daemon.service

# Start wpa_supplicant.service because wifi
systemctl start wpa_supplicant.service

# Start NetworkManager.service because network management
systemctl start NetworkManager.service

# Start networking.service because networking
systemctl start networking.service

# Start pppd-dns.service because we're going to party like it's 1999
#systemctl start pppd-dns.service

# Start ModemManager.service because we are a cell phone.
#systemctl start ModemManager.service

# Start debugging systemd because we broke stuff
#systemctl start debug-shell.service
