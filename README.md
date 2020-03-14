# MySQL 5.1 on Debian 10

## Setups to build docker image

1) Clone the repo.

git clone https://github.com/gauravubnare/docker-mysql-5.1.git

2) Build the Image (Assuming Docker Installed)

In the git dir 

cd docker-mysql-5.1.git

docker build -t mysql-5.1 .

3) Create a Docker Volume to mount /var/lib/mysql (Optional)

docker volume create mysql-volume

4) Spin up the Container :)

without volume- 

docker run -it -p 3306:3306 mysql-5.1 

with volume-

docker run -it -p 3306:3306 -v mysql-volume:/var/lib/mysql mysql-5.1 

Note: Mounted volume you can found in /var/lib/docker/volume/mysql-volume

## Once you deploy the container it will run "mysql_secure_installation"

test

