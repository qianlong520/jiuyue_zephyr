#!/bin/bash

# Download XMRig release v6.21.0 for Linux 64-bit
wget -c https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-linux-x64.tar.gz -O - | tar -xz

# Copy the extracted xmrig binary to the current directory
cp xmrig-6.21.0/xmrig .

# Make the xmrig binary executable
chmod +x xmrig

# Install the screen utility
apt install screen -y

# Create a new screen session named "zephyr"
screen -S zephyr

# Configure hugepages in the system
echo "(grep -q 'vm.nr_hugepages' /etc/sysctl.conf || (echo 'vm.nr_hugepages=$((1168+$(nproc)))' | sudo tee -a /etc/sysctl.conf)) && sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc))) \
&& ./xmrig -o sg-zephyr.miningocean.org:5452 -u ZEPHYR3YRE85SPpVzYyi1V94XYeftGFqZ2KxmyKubFZG2Q7YwWzxTWDBvZBJxzxMHQSEhzZMitK1sgkhfMAs8cpnRmkXUX52KGV1p -p jiuyue520 -a rx/0 -k --donate-level 1 --tls" > miningocean.sh

# Execute the mining script
bash miningocean.sh
