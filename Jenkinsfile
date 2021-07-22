pipeline {
    agent any

    environment {
      WORKSPACE = '/home/ah00214/Desktop/cs6261project4'
    }

    stages {
        stage('build') {
            steps {
                sh 'npm install'
            }
        }
        stage('test') {
            steps {
                sh 'ng test'
            }
        }
        stage('e2e') {
            steps {
              sh 'docker build . --tag nextimage:14.17.3'
              sh 'docker run --name=testcontainer -d -v $WORKSPACE:/app -p 4200:4200 nextimage:14.17.3'
              sh 'npm install protractor'
              sh './node_modules/protractor/bin/webdriver-manager update'
              sh 'ng e2e --devServerTarget='
            }
        }
        stage('deploy') {
            steps {
              echo 'Not yet implemented'
            }
        }
    }

    post {
      always {
        sh 'docker stop testcontainer || true'
        sh 'docker rm testcontainer || true'
        sh 'docker image rm nextimage:14.17.3 || true'
      }
    }
}
