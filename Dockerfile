FROM centos:centos7.5.1804
MAINTAINER Suneel <sunikulk0208@gmail.com>

WORKDIR /opt/cobol
COPY . .

RUN yum -y install libgmp3-dev libtool libdb-dev ncurses-dev libncurses-dev 
RUN yum -y install gmp gmp-devel libtool ncurses ncurses-devel ncurses-libs make
RUN yum -y install libdbi libdbi-devel libtool-ltdl libtool-ltdl-devel db4 db4-devel
RUN yum -y install wget
cd gnucobol-3.0-rc1 && ./configure --without-db && make && make check && make install

 RUN ldconfig
 RUN cobc -V
 RUN export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

EXPOSE 8080
CMD tail -f /dev/null
