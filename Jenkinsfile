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
      sh'./comp.sh build --no-daemon'
      sh'scp intro1 /home/centos/suneelcobolmasterbranch/'
          }
                        }
    
       stage('docker images code') { 
 		steps {
  			script {
          sh'pwd'
       				sh 'docker build  -t  suneelkulk/col Dockerfile'
              sh 'docker run -p 8090:8090 -d suneelkulk/col'
        }
    }
  }
 }
}
