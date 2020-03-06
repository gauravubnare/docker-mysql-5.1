FROM debian:10
RUN apt-get update && apt install procps build-essential wget libncurses5-dev -y
RUN useradd mysql
RUN cd && wget http://dev.mysql.com/get/Downloads/MySQL-5.1/mysql-5.1.73.tar.gz && tar xzvf mysql-5.1.73.tar.gz && cd mysql-5.1.73 && ./configure \
'--prefix=/usr' \
'--exec-prefix=/usr' \
'--libexecdir=/usr/sbin' \
'--datadir=/usr/share' \
'--localstatedir=/var/lib/mysql' \
'--includedir=/usr/include' \
'--infodir=/usr/share/info' \
'--mandir=/usr/share/man' \
'--with-system-type=debian-linux-gnu' \
'--enable-shared' \
'--enable-static' \
'--enable-thread-safe-client' \
'--enable-assembler' \
'--enable-local-infile' \
'--with-fast-mutexes' \
'--with-big-tables' \
'--with-unix-socket-path=/var/run/mysqld/mysqld.sock' \
'--with-mysqld-user=mysql' \
'--with-libwrap' \
'--with-readline' \
'--with-ssl' \
'--without-docs' \
'--with-extra-charsets=all' \
'--with-plugins=max' \
'--with-embedded-server' \
'--with-embedded-privilege-control' \
CXXFLAGS="-std=gnu++98" && make && make install
RUN mkdir -p /etc/mysql && mkdir -p /var/lib/mysql && mkdir -p /etc/mysql/conf.d && echo -e '[mysqld_safe]\nsyslog' > /etc/mysql/conf.d/mysqld_safe_syslog.cnf && cp /usr/share/mysql/my-medium.cnf /etc/mysql/my.cnf && sed -i 's#.*datadir.*#datadir = /var/lib/mysql#g' /etc/mysql/my.cnf && chown mysql:mysql -R /var/lib/mysql && mysql_install_db --user=mysql 
RUN cp /usr/share/mysql/mysql.server /etc/init.d/mysql
RUN chmod +x /etc/init.d/mysql
RUN update-rc.d mysql defaults
ENTRYPOINT /etc/init.d/mysql start ; mysql_secure_installation ; bash
