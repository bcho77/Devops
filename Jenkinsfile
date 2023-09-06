pipeline{
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('vaninoel')
    }
    stages {
        stage(Checkout){
            steps {
                checkout scm
                git 'https://github.com/bcho77/Devops.git'
            }
        }
        stage('Build image'){
            steps{
                sh' sudo docker build -t vaninoel/node:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('push image'){
            steps{
                sh' sudo docker push vaninoel/node:$BUILD_NUMBER'
            }
        }
    }
    post{
        always{
            sh 'sudo docker logout'
        }
    }
}