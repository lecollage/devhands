which xclock
dpkg -S /usr/bin/xclock
dpkg -s iputils-ping
sudo dpkg -r iputils-ping // remove the package

sudo apt install -f ./ubuntu-minimal_1.450_amd64.deb
sudo apt show ubuntu-minimal
sudo apt list ubuntu-minimal --installed
sudo apt install --only-upgrade ubuntu-minimal

apt search Helps download and run the Tor browser

sudo apt remove -y torbrowser-launcher






///////////////////////////
INSTALL NGINX

https://nginx.org/download/

sudo apt-get install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev
cd /local/src
sudo wget http://nginx.org/download/nginx-1.26.0.tar.gz
sudo tar -zxvf nginx-1.26.0.tar.gz
sudo ./configure \
--prefix=/var/www/html \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--http-log-path=/var/log/nginx/access.log \
--error-log-path=/var/log/nginx/error.log \
--with-pcre \
--lock-path=/var/lock/nginx.lock \
--pid-path=/var/run/nginx.pid \
--with-http_ssl_module \
--with-http_image_filter_module=dynamic \
--modules-path=/etc/nginx/modules \
--with-http_v2_module \
--with-stream=dynamic \
--with-http_addition_module \
--with-http_mp4_module \
--with-mail=dynamic

sudo make
sudo make install
sudo nginx
sudo nginx -V

https://www.nginx.com/blog/tuning-nginx/
https://www.alibabacloud.com/blog/how-to-build-nginx-from-source-on-ubuntu-20-04-lts_597793

sudo nginx -s stop
sudo nano /lib/systemd/system/nginx.service
sudo systemctl daemon-reload
sudo systemctl reload-or-restart nginx.service
sudo systemctl status nginx.service
netstat -nplt

[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target



CERT 
https://www.nginx.com/blog/using-free-ssltls-certificates-from-lets-encrypt-with-nginx/

sudo certbot --nginx -d ekalashnikov.devhands.cloud -d www.ekalashnikov.devhands.cloud

Certificate is saved at: /etc/letsencrypt/live/ekalashnikov.devhands.cloud/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/ekalashnikov.devhands.cloud/privkey.pem


    server_name  ekalashnikov.devhands.cloud www.ekalashnikov.devhands.cloud;

    listen 443 ssl; # managed by Certbot

    # RSA certificate
    ssl_certificate /etc/letsencrypt/live/ekalashnikov.devhands.cloud/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/ekalashnikov.devhands.cloud/privkey.pem; # managed by Certbot

    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

    # Redirect non-https traffic to https
    if ($scheme != "https") {
        return 301 https://$host$request_uri;
    } # managed by Certbot

crontab -e
0 12 * * * /usr/bin/certbot renew --quiet

//////////////////////




//////////////////////
INSTALL NETSTAT

sudo apt-get install net-tools
//////////////////////






//////////////////////
INSTALL REDIS

https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/install-redis-on-linux/

sudo apt install lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
sudo apt-get install redis

https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04

sudo systemctl restart redis.service
sudo systemctl enable redis-server
//////////////////////



//////////////////////
INSTALL DOCKER
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
//////////////////////



//////////////////////
INSTALL POSTGRES

https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart
//////////////////////



//////////////////////
INSTALL NODE.JS

https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04
cd ~
curl -sL https://deb.nodesource.com/setup_21.x -o nodesource_setup.sh
sudo bash ./nodesource_setup.sh
sudo apt install nodejs

NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
//////////////////////




//////////////////////
CONFIGURE GIT 

git config --global user.name "Eugene Kalashnikov"
git config --global user.email "ekalashnikov59@gmail.com"

ssh-keygen -t ed25519 -C "ekalashnikov59@gmail.com"
//////////////////////




//////////////////////
TOOLS

sudo apt-get install lshw
//////////////////////


ls -l /proc/ | wc -l
ls -ld /proc/* | grep packer

ps -elf 
ps aux
ps aux | grep ssh

pstree

kill PID



//////////////////////


cd ~ 
echo "alias ll='ls -la' > .bashrc"
source ~/.bashrc

// change your password
passwd

// change root password
sudo passwd


systemctl list-units
service --status-all





sudo wget http://www.openssl.org/source/openssl-1.1.1t.tar.gz
sudo tar -zxf openssl-1.1.1t.tar.gz \
cd openssl-1.1.1t  \
sudo ./Configure linux-x86_64 --prefix=/usr \
sudo make \
sudo make install



sudo wget https://www.postgresql.org/ftp/source/v15.3/postgresql-15.3.tar.gz
sudo wget https://ftp.postgresql.org/pub/source/v15.3/postgresql-15.3.tar.gz



sudo ./configure \
--sbin-path=/usr/local/nginx/nginx \
--conf-path=/usr/local/nginx/nginx.conf \
--pid-path=/usr/local/nginx/nginx.pid \
--with-pcre=../pcre2-10.42 \
--with-zlib=../zlib-1.2.13 \
--with-http_ssl_module \
--with-stream \
--with-mail=dynamic \
--add-module=/local/src/nginx-rtmp-module-master

sudo wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb











[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/nginx.pid
ExecStartPre=/usr/local/nginx/nginx -t
ExecStart=/usr/local/nginx/nginx
ExecReload=/usr/local/nginx/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target








[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/nginx.pid
ExecStartPre=/usr/local/nginx/nginx -t
ExecStart=/usr/local/nginx/nginx
ExecReload=/usr/local/nginx/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target



[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/bin/nginx -t
ExecStart=/usr/bin/nginx
ExecReload=/usr/bin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target






sudo systemctl start nginx.service
sudo systemctl reload nginx.service
sudo systemctl reload-or-restart nginx.service
sudo systemctl daemon-reload


sudo systemctl reload nginx
sudo systemctl enable nginx
sudo journalctl -f -u nginx
sudo service nginx status

sudo systemctl enable redis

sudo systemctl enable test_api
sudo systemctl daemon-reload
sudo systemctl reload-or-restart test_api.service
sudo systemctl enable test_api



sudo apt update
sudo apt install redis-server

sudo wget https://download.redis.io/redis-stable.tar.gz
sudo tar -xzvf redis-stable.tar.gz
cd redis-stable
sudo make

sudo -u postgres createuser --interactive
sudo -u postgres createuser ekalashnikov
sudo -u postgres createdb john
sudo -u postgres createdb smith
sudo -u postgres createdb ekalashnikov

sudo adduser john
sudo adduser smith
sudo adduser ekalashnikov
sudo -i -u john
sudo -i -u smith
sudo -i -u ekalashnikov
psql

psql -d john
psql -d smith
psql -d ekalashnikov

ALTER ROLE ekalashnikov WITH PASSWORD '12345';

CREATE TABLE playground (
    equip_id serial PRIMARY KEY,
    type varchar (50) NOT NULL,
    color varchar (25) NOT NULL,
    location varchar(25) check (location in ('north', 'south', 'west', 'east', 'northeast', 'southeast', 'southwest', 'northwest')),
    install_date date
);


curl -OL https://golang.org/dl/go1.20.7.linux-amd64.tar.gz
sha256sum go1.20.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.20.7.linux-amd64.tar.gz

scp /home/ekalashnikov/work/go/gin-test-rest-api/test_api ekalashnikov@ekalashnikov.devhands.cloud:/local/test/test_api

ssh ekalashnikov@ekalashnikov.devhands.cloud

scp sourceuser@sourcehost:/path/to/source/file destinationuser@destinationhost:/path/to/destination/

pg_isready -d smith -h 127.0.0.1 -p 5432 -U smith
pg_isready -d smith -h localhost -p 5432 -U smith


DB_HOST=127.0.0.1
DB_PORT=5432
DB_NAME=smith
APPLICATION_POSTGRES_USER=smith
APPLICATION_POSTGRES_PW=12345

	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	username := os.Getenv("APPLICATION_POSTGRES_USER")
	password := os.Getenv("APPLICATION_POSTGRES_PW")
	databaseName := os.Getenv("DB_NAME")


sudo -u postgres createuser -s -i -d -r -l -w admin
sudo -u postgres psql -c "ALTER ROLE admin WITH PASSWORD 'admin';"

systemctl is-failed test_api.service

sudo nano /lib/systemd/system/test_api.service
sudo systemctl daemon-reload
sudo systemctl reload-or-restart test_api.service
sudo journalctl -f -u test_api
sudo service test_api status

sudo service test_api stop
sudo service test_api start

journalctl -u test_api.service
systemctl -l status test_api





[Unit]
Description=test_api

[Service]
Type=simple
Restart=always
RestartSec=5s
ExecStart=/local/test/test_api/test_api
EnvironmentFile=/local/test/test_api/test_api.conf
WorkingDirectory=/local/test/test_api

[Install]
WantedBy=multi-user.target




proxy_pass http://localhost:8000;





https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04#step-5-%E2%80%93-setting-up-server-blocks-(recommended)

/etc/nginx/sites-available/example.com

sudo mkdir -p /var/www/ekalashnikov.devhands.cloud/html
sudo chown -R $USER:$USER /var/www/ekalashnikov.devhands.cloud/html
sudo chmod -R 755 /var/www/ekalashnikov.devhands.cloud
sudo nano /var/www/ekalashnikov.devhands.cloud/html/index.html

<html>
    <head>
        <title>Welcome to ekalashnikov.devhands.cloud!</title>
    </head>
    <body>
        <h1>Success!  The ekalashnikov.devhands.cloud server block is working!</h1>
    </body>
</html>

sudo nano /etc/nginx/sites-available/ekalashnikov.devhands.cloud

server {
        listen 80;
        listen [::]:80;

        root /var/www/ekalashnikov.devhands.cloud/html;
        index index.html index.htm index.nginx-debian.html;

        server_name ekalashnikov.devhands.cloud www.ekalashnikov.devhands.cloud;

        location / {
                try_files $uri $uri/ =404;
        }
}

sudo ln -s /etc/nginx/sites-available/ekalashnikov.devhands.cloud /etc/nginx/sites-enabled/


sudo nano /etc/nginx/sites-available/ekalashnikov.devhands.cloud
sudo ufw status

sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

sudo certbot --nginx -d ekalashnikov.devhands.cloud -d www.ekalashnikov.devhands.cloud
ekalashnikov59@gmail.com

sudo systemctl status certbot.timer
sudo certbot renew --dry-run



https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-grafana-on-ubuntu-22-04
https://grafana.com/tutorials/run-grafana-behind-a-proxy/
https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/

sudo apt-get install -y apt-transport-https \
sudo apt-get install -y software-properties-common wget \
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

/usr/share/keyrings/grafana.key != /etc/apt/keyrings/grafana.gpg

sudo apt install software-properties-common
type apt-add-repository

wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
sudo apt install grafana
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server

...
	location / {
	   proxy_set_header Host $http_host;
	   proxy_pass http://localhost:3000;
	}
...


        location / {
            root   html;
            index  index.html index.htm;
        }

        location /api {
            proxy_pass http://localhost:8000;
        }

        location /auth {
            proxy_pass http://localhost:8000;
        }

sudo nginx -t
sudo systemctl reload nginx



sudo nano /etc/grafana/grafana.ini


https://oastic.com/posts/how-to-monitor-an-ubuntu-server-with-grafana-and-prometheus/

sudo apt install prometheus prometheus-node-exporter
sudo apt install net-tools
netstat -plunt
prometheus-node-exporter --version





https://github-wiki-see.page/m/giltene/wrk2/wiki/Installing-wrk2-on-Linux

wrk https://ekalashnikov.devhands.cloud/app/test/hello
wrk -t5 -c55 -d5 --latency https://ekalashnikov.devhands.cloud/app/test/hello
wrk -t 40 -c 5000 -R 10000000 https://ekalashnikov.devhands.cloud/app/test/hello

wrk -t5 -c55 -d5 --latency https://ekalashnikov.devhands.cloud/app/test/sleep?s=5
wrk -t 40 -c 5000 -R 10000000 https://ekalashnikov.devhands.cloud/app/test/sleep?s=5

wrk -t2 -c100 -d30s -R2000 http://localhost:8000/app/test/cpu-load-sync?number=60
wrk -t2 -c100 -d30s -R2000 http://localhost:8000/app/test/cpu-load-async?ms=200
wrk -t4 -c4 -d60s -R1000 --latency http://localhost:8000/app/test/cpu-load-sync?number=300

./wrk -t4 -c4 -d60s -L -R1000


go get -u github.com/gin-gonic/gin
go get -u github.com/redis/go-redis/v9
go get -u github.com/google/uuid

wrk -T8 -C16 -L -R1000 -d60 http://localhost/index.html
wrk -T8 -C16 -L -R1000 -d60 http://localhost
wrk -t2 -c10 -d60s -R1000 http://localhost:8000/app/test/cpu-load-sync?number=1003

wrk -t8 -c16 -L -R25000 -d60 https://ekalashnikov.devhands.cloud > wrk-results/1.wrk
sudo wrk -t8 -c16 -L -R100000 -d60 http://localhost:8000