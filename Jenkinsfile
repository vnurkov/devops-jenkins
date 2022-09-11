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
      steps {
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      steps {
        sh 'docker tag hello-py 192.168.31.191:5000/hello-py'
        sh 'docker push 192.168.31.191:5000/hello-py'
      }
    }

    stage('Deploy to kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", kubeconfigId: "kubernetes")
        }
      }
    }
  }
}