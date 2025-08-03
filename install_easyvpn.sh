#!/bin/bash
# EasyVPN offline installer for Issabel 4 / CentOS 7

echo "[*] Installing local RPMs..."
cd "$(dirname "$0")/rpms" || exit

yum localinstall -y *.rpm --nogpgcheck

if [ $? -eq 0 ]; then
    echo "[✓] Issabel EasyVPN installation completed successfully!"
else
    echo "[✗] Installation failed. Please check missing dependencies."
fi
