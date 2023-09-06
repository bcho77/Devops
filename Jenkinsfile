pipeline{
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('vaninoel')
    }
    stages{
        stage(checkout){
            steps{

               git'https://github.com/bcho77/Devops.git'
            }
        }
        stage('Build image') {
            steps{
                sh 'sudo docker build -t vaninoel/pipepline:$BUILD_NUMBER .'
            }
        }
        stage('Login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push to dockerhub') {
            steps{
                sh '''
                sudo docker images 
                sudo docker push vaninoel/pipepline:$BUILD_NUMBER
                '''
            }
        }
         stage('Pull image') {
            steps{
                sh 'sudo docker pull vaninoel/pipepline:14' 
            }
         }
        stage('Run Image') {
            steps{
                sh '''
                 sudo sudo docker run -d -p 8082:80  --name mypipeline1 vaninoel/pipepline:14
                 sudo docker ps -a 
             '''
            }
        }      
        
    }
    post{
        always{
            sh 'sudo docker logout'
        }
    }
}
