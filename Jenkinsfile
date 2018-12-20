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
     echo 'Running Build Automation'
      sh 'sudo chmod +x comp.sh'
      sh './comp.sh build --no-daemon'
      sh 'sudo docker container cp /home/centos/suneelcobolmasterbranch/* 4c21e65feeba:/opt/cobol/.'
/*      sh'scp intro1 /home/centos/suneelcobolmasterbranch/' */
          }
                        }
  }
 }
