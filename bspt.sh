#!/bin/bash

# Kiểm tra xem iptables đã được cài đặt hay chưa
if ! command -v iptables &> /dev/null; then
    echo "iptables is not installed. Installing..."
    
    # Cài đặt iptables sử dụng trình quản lý gói phù hợp
    if [ -x "$(command -v apt)" ]; then
        sudo apt update
        sudo apt install iptables
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install iptables
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install iptables
    else
        echo "Unsupported package manager. Please install iptables manually."
        exit 1
    fi
fi

# Thiết lập luật iptables
sudo iptables -A INPUT -m string --algo bm --string "speedtest" -j DROP
sudo iptables -A INPUT -s api.fast.com -j DROP
sudo iptables -A INPUT -s speed.io -j DROP

echo "chặn xong rồi"


