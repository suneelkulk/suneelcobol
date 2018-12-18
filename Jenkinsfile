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
