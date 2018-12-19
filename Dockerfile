FROM centos:centos7
MAINTAINER Suneel <sunikulk0208@gmail.com>
#
RUN yum -y install libgmp3-dev libtool libdb-dev ncurses-dev libncurses-dev; yum clean all
RUN yum install gmp gmp-devel libtool ncurses ncurses-devel ncurses-libs make; yum clean all
RUN yum install libdbi libdbi-devel libtool-ltdl libtool-ltdl-devel db4 db4-devel; yum clean all
RUN yum -y install wget; yum clean all
RUN updatedb; yum clean all
RUN wget http://sourceforge.net/projects/open-cobol/files/gnu-cobol/3.0/gnucobol-3.0-rc1.tar.gz
RUN tar xvf gnucobol-3.0-rc1.tar.gz
RUN cd gnucobol-3.0-rc1
RUN ./configure --without-db
RUN make
RUN make check
RUN make install
RUN ldconfig
RUN cobc -V
RUN export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
EXPOSE 8080
