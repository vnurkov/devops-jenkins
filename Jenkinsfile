pipeline {
  
  environment {
    registry = "localhost:5000/my-python:3.9"
    dockerImage = ""
  }
  
  agent {label 'kubepod'}

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
        dir ('source') {
          sh 'docker build -t localhost:5000/my-python:3.9 .'
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", kubeconfigId: "kubernetes")
        }
      }
    }

  }

}