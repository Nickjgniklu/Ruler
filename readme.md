#how to Start

## cinfigure iptable on you computer
sudo iptables -A INPUT  -p tcp  -s 10.0.0.0/24 --dport 8000 -j ACCEPT
make sure you match the ipadresses that could be used by your router
## make you laptops ip adress and allowed host in sensors project setting file
## start server
manage.py runserver 0.0.0.0:8000


