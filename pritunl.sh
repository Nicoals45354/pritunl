#Mise a jours packet

sudo apt update
sudo apt upgrade

#pare feux ufw

sudo ufw allow http
sudo ufw allow https
sudo ufw allow 10447/udp
sudo ufw reload

#repository pritunl

echo "deb http://repo.pritunl.com/stable/apt bionic main" | sudo tee /etc/apt/sources.list.d/pritunl.list
sudo nano /etc/apt/sources.list.d/mongodb-org-4.0.list
deb https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse

#public Key

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt update

#install mongodb et pritunl

sudo apt --assume-yes install pritunl mongodb-server
sudo systemctl start pritunl mongodb
sudo systemctl enable pritunl mongodb

#generation key

sudo pritunl setup-key

#generation idd

sudo pritunl default-password