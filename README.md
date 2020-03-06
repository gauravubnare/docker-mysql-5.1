# MySQL 5.1 on Debian 10

## Setups to build docker image

1) Clone the repo.

git clone https://github.com/gauravubnare/docker-mysql-5.1.git

2) Build the Image (Assuming Docker Installed)

In the git dir 

cd docker-mysql-5.1.git

docker build -t mysql-5.1 .

3) Spin up the Container :)

docker run -it -p 3306:3306 mysql-5.1 

## Once you deploy the container it will run the "mysql_secure_installation"


