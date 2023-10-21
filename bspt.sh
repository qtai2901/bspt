sudo iptables -A INPUT -m string --algo bm --string "speedtest" -j DROP
sudo iptables -A INPUT -s api.fast.com -j DROP
sudo iptables -A INPUT -s speed.io -j DROP
