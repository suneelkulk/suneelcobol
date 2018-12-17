pipeline {
  agent any
  stages {
    stage ('checkout') {
    steps {
     checkout scm
    }
    }
   stage ('Build') {
    steps {
     echo 'Running Build Automation'
     sh 'make'
     archiveArtifacts artifacts: 'dist/cobprogs.zip'
    }
   }
  }
 }
