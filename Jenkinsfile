#!/usr/bin/env groovy
node {
      stage('Preparation') {
	      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/zborisha/consul-docker.git']]])
      }
      stage('Docker') {
          echo "building new docker"
          dockerApp = docker.build("025647036827.dkr.ecr.us-west-2.amazonaws.com/tango")
      }
      stage('Push Docker') {
	withDockerRegistry([credentialsId: 'ecr:us-west-2:jenkins-user', url: 'https://025647036827.dkr.ecr.us-west-2.amazonaws.com/nginx']) {
          dockerApp.push("latest")
	}
      }
     stage('Results') {
        currentBuild.result = 'SUCCESS'
    }
}
