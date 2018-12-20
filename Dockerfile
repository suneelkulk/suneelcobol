<<<<<<< HEAD
#FROM node:carbon
=======
>>>>>>> 848aba8f31a977e50835e0bf9d9cad6da37f1ff2
FROM centos:centos7.5.1804
MAINTAINER Suneel <sunikulk0208@gmail.com>
#

WORKDIR /opt/cobol
COPY . .

RUN yum -y install libgmp3-dev libtool libdb-dev ncurses-dev libncurses-dev && \
 yum -y install gmp gmp-devel libtool ncurses ncurses-devel ncurses-libs make && \
yum -y install libdbi libdbi-devel libtool-ltdl libtool-ltdl-devel db4 db4-devel && \

 yum -y install wget && \

yum -y install wget && \

cd gnucobol-3.0-rc1 && ./configure --without-db && make && make check && make install && \

 ldconfig && \
 cobc -V && \
 export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH && \

EXPOSE 8080
CMD ./intro1
