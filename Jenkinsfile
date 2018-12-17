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
     archiveArtifacts artifacts: 'dist/cobprogs.zip'
    }
   }
  }
 }
