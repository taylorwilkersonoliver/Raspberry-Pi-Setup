##!/bin/bash
## Node Configuration 1.0
## By: Taylor Oliver
## Date: 2017/09/05
##
## Reason:
##    Streamlined boot for beowulf cluster nodes to be followed by post-boot scripts that load only what's necessary.
##    cat initial_setup_script.sh | cut -c2- > uncommented_initial_setup_script.sh && chmod +x uncommented_initial_setup_script.sh && ./uncommented_initial_setup_script.sh
## Metrics:
##    systemd-analyze
##        Before:
##            Startup finished in 35.150s (kernel) + 2.613s (userspace) = 37.764s
##            graphical.target reached after 2.582s in userspace
##        After:
##            Startup finished in 4.224s (kernel) + 2.789s (userspace) = 7.013s
##            graphical.target reached after 2.763s in userspace
###########
###########
###########
## Eliminate grub timeout because one OS
#sed -i "s/GRUB_TIMEOUT=./GRUB_TIMEOUT=0/g" /etc/default/grub
##
###########
## Plug in the right information from blkid like '/dev/mapper/whatever--vg-root'
#echo "RESUME=UUID=/dev/mapper/kali--vg-root" > /etc/initramfs-tools/conf.d/resume
##
###########
## Disable hibernation and sleep because the enemy never sleeps (jk)
#sed -i "s/RESUME=UUID=/# RESUME=UUID=/g" > /etc/initramfs-tools/conf.d/resume
##
###########
## Use RAM more often instead of swap because RAM is faster (fine-tune this based on the device)
#echo "vm.swappiness=10" >> /etc/sysctl.conf
##
############
## Disable debug-shell.service because not debugging systemd
#systemctl stop debug-shell.service
#systemctl disable debug-shell.service
##
############
## Disable bluetooth.service because it's not needed for boot
#systemctl stop bluetooth.service
#systemctl disable bluetooth.service
##
###########
## Disable avahi-daemon.service because it's not needed for boot
#systemctl stop avahi-daemon.service
#systemctl disable avahi-daemon.service
##
###########
## Disable wpa_supplicant.service because it's not needed for boot
#systemctl stop wpa_supplicant.service
#systemctl disable wpa_supplicant.service
##
###########
## Disable NetworkManager.service because it's not needed for boot
#systemctl stop  NetworkManager.service
#systemctl disable NetworkManager.service
##
###########
## Disable networking.service because it's not needed for boot
#systemctl stop networking.service
#systemctl disable networking.service
##
###########
## Disable stunnel4.service because it's not needed for boot
#systemctl stop stunnel4.service
#systemctl disable stunnel4.service
##
###########
## Disable pppd-dns.service because not using dial-up (unless too 1337 for anything else, may not have pppd-dns)
#systemctl stop pppd-dns.serviced
#systemctl disable pppd-dns.serviced
##
###########
## Disable ModemManager.service because this isn't a cell phone (unless this is a cell phone)
#systemctl stop ModemManager.service
#systemctl disable ModemManager.service
##
###########
## Disable ufw.service because networking is disabled during boot (start ufw post-boot instead)
#systemctl stop ufw.service
#systemctl disable ufw.service
##
###########
## Disable rsyslog.service because how often do you really use it?
#systemctl disable rsyslog.service
##
###########
## Speed up journald because logging is for the weak (jk)
#cat /etc/systemd/journald.conf > /etc/systemd/journald.conf_`date +%Y-%m-%d_%H-%M-%S`
#cat /etc/systemd/journald.conf > /etc/systemd/journald.conf.old
#cat /etc/systemd/journald.conf.old | sed "s/SystemMaxUse=/SystemMaxUse=100M/" > /etc/systemd/journald.conf
#journalctl --vacuum-size=50M
#systemctl kill --kill-who=main --signal=SIGUSR2 systemd-journald.service
#systemctl restart systemd-journald.service
##
###########
## Update grub because changes were made
#update-grub
##
###########
## Update initramfs because changes were made
#update-initramfs -u
##
###########
## Reboot because racecar
#shutdown -r now
