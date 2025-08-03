#!/bin/bash
# Install Issabel EasyVPN on CentOS 7 / Issabel 4
# Author: Your Name
# Last Updated: August 2025

set -e

echo "=== Cleaning YUM cache ==="
yum clean all
yum makecache

echo "=== Moving to /usr/src ==="
cd /usr/src

echo "=== Downloading required packages ==="
wget -nc http://repo.issabel.org/issabel/4/updates/x86_64/RPMS/issabel-easyvpn-4.0.0-2.noarch.rpm
wget -nc https://dl.marmotte.net/rpms/redhat/el7/x86_64/openvpn-2.4.12-1.el7_9/openvpn-2.4.12-1.el7_9.x86_64.rpm
wget -nc https://archives.fedoraproject.org/pub/archive/epel/7/x86_64/Packages/e/easy-rsa-3.0.8-1.el7.noarch.rpm
wget -nc https://dl.marmotte.net/rpms/redhat/el7/x86_64/pkcs11-helper-1.11-3.el7/pkcs11-helper-1.11-3.el7.x86_64.rpm

echo "=== Installing packages ==="
yum localinstall -y --nogpgcheck \
    pkcs11-helper-1.11-3.el7.x86_64.rpm \
    openvpn-2.4.12-1.el7_9.x86_64.rpm \
    easy-rsa-3.0.8-1.el7.noarch.rpm \
    issabel-easyvpn-4.0.0-2.noarch.rpm

echo "=== Enabling and starting Issabel EasyVPN service ==="
systemctl enable issabel-easyvpn
systemctl start issabel-easyvpn

echo "=== Installation completed successfully! ==="
systemctl status issabel-easyvpn --no-pager
