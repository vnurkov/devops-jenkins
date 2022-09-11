pipeline {
  
  agent any

  environment {
    dockerimagename = "hello-py"
    dockerImage = ""
  }

  stages {

    stage('Checkout Source') {
      steps {
        dir('source') {
          git branch: 'main', url: 'https://github.com/vnurkov/devops-jenkins.git'
        }
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Deploy to kubernetes') {
      steps{
        script {
          kubernetesDeploy(configs: "deployment.yaml", kubeconfigId: "kubernetes")
        }
      }
    }
  }
}