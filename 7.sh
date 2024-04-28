sudo service nginx start
sudo service nginx status
systemctl show ssh.service | wc -l
systemctl show nginx.service | wc -l
sudo service nginx status
sudo service redis status

sudo apt update
sudo apt install postgresql postgresql-contrib
sudo service postgres status

cd /local/src/
ll


sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
sudo apt-get install ssl-cert
sudo apt install ssl-cert


sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
cat /etc/apt/sources.list.d/pgdg.list
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
sudo apt install postgresql postgresql-contrib
sudo apt install gcc zlib1g-dev libreadline6-dev
sudo nano /etc/apt/sources.list.d/pgdg.list
sudo rm /etc/apt/sources.list.d/pgdg.list
sudo apt install gcc zlib1g-dev libreadline6-dev
sudo apt update
apt list --upgradable
sudo apt upgrade






































Could not create certificate. Openssl output was:
openssl: symbol lookup error: openssl: undefined symbol: EVP_mdc2, version OPENSSL_1_1_0
dpkg: error processing package ssl-cert (--configure):
 installed ssl-cert package post-installation script subprocess returned error exit status 1
dpkg: dependency problems prevent configuration of postgresql-common:
 postgresql-common depends on ssl-cert (>= 1.0.11); however:
  Package ssl-cert is not configured yet.

dpkg: error processing package postgresql-common (--configure):
 dependency problems - leaving unconfigured
Setting up python-apt-common (2.4.0ubuntu2) ...
No apport report written because the error message indicates its a followup error from a previous failure.
                                                                                                          Setting up thermald (2.4.9-1ubuntu0.3) ...
dpkg: dependency problems prevent configuration of postgresql-15:
 postgresql-15 depends on postgresql-common (>= 241~); however:
  Package postgresql-common is not configured yet.
 postgresql-15 depends on ssl-cert; however:
  Package ssl-cert is not configured yet.

dpkg: error processing package postgresql-15 (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup error from a previous failure.
                                                                                                          dpkg: dependency problems prevent configuration of postgresql-14:
 postgresql-14 depends on postgresql-common (>= 229~); however:
  Package postgresql-common is not configured yet.
 postgresql-14 depends on ssl-cert; however:
  Package ssl-cert is not configured yet.

dpkg: error processing package postgresql-14 (--configure):
 dependency problems - leaving unconfigured
No apport report written because MaxReports is reached already
                                                              Setting up python3-apt (2.4.0ubuntu2) ...
dpkg: dependency problems prevent configuration of postgresql-contrib:
 postgresql-contrib depends on postgresql-contrib-15; however:
  Package postgresql-contrib-15 is not installed.
  Package postgresql-15 which provides postgresql-contrib-15 is not configured yet.

dpkg: error processing package postgresql-contrib (--configure):
 dependency problems - leaving unconfigured
No apport report written because MaxReports is reached already
                                                              dpkg: dependency problems prevent configuration of postgresql:
 postgresql depends on postgresql-15; however:
  Package postgresql-15 is not configured yet.

dpkg: error processing package postgresql (--configure):
 dependency problems - leaving unconfigured
No apport report written because MaxReports is reached already
                                                              Processing triggers for rsyslog (8.2112.0-2ubuntu2.2) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for dbus (1.12.20-2ubuntu4.1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
Errors were encountered while processing:
 ssl-cert
 postgresql-common
 postgresql-15
 postgresql-14
 postgresql-contrib
 postgresql
needrestart is being skipped since dpkg has failed



sudo apt remove package_name

sudo apt remove ssl-cert
sudo apt remove postgresql-14
sudo apt remove postgresql-15
sudo apt remove postgresql-client-14
sudo apt remove postgresql-client-15
sudo apt remove postgresql-client-common
sudo apt remove postgresql-common
sudo apt remove postgresql-contrib
sudo apt remove postgresql

