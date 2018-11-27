#How to Start
Here are some tips for runnig the project in a local network.
If you want to put it on a cloud server your own your own.

## configure iptable on you computer
sudo iptables -A INPUT  -p tcp  -s 10.0.0.0/24 --dport 8000 -j ACCEPT

Make sure you match the ipadresses that could be used by your router
## Make your laptops ip addess an allowed host in sensors project setting file
## Start server
manage.py runserver 0.0.0.0:8000


