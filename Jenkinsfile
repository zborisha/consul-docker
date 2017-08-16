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
          dockerApp.push("latest")
      }
     stage('Results') {
        currentBuild.result = 'SUCCESS'
        slackSend color: '#3fb0ac', message: "sbt pipeline example (build #${currentBuild.number}) ended: ${currentBuild.result}"
    }
}
