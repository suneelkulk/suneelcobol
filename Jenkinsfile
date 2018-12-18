pipeline {
  agent any
  stages {
    stage ('checkout') {
    steps {
     checkout scm
          }
                       }
   stage ('Build')     {
    steps {
     echo 'Installing Open Cobol'
      sh 'sudo -S  yum -y install libgmp3-dev libtool libdb-dev ncurses-dev libncurses-dev'
      sh 'sudo -S yum install gmp gmp-devel libtool ncurses ncurses-devel ncurses-libs make'
      sh 'sudo -S yum install libdbi libdbi-devel libtool-ltdl libtool-ltdl-devel db4 db4-devel'
      sh 'sudo ./configure --without-db'
      sh 'sudo make'
      sh 'sudo make check'
      sh 'sudo make install'
      sh 'sudo ldconfig'
      sh 'cobc -V'
     echo 'Running Build Automation'
      sh'cobc -x intro1.cbl'
      sh'scp intro1 /home/centos/suneelcobolmasterbranch/'
          }
                        }
  }
 }
