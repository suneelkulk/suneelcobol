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
      sh'cobc -V'
     sh 'cobc -x intro1.cbl'
     sh 'scp intro1 /home/centos/suneelcobolmasterbranch/'
    }
   }
  }
 }
