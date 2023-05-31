pipeline {
    agent any
   
    tools{
        maven 'maven_3_5_0'
    }
    stages
    {
        stage('Build Maven'){
    steps{
         checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/swathiv1989/swathi-maven-docker-project']])        
         bat 'mvn clean install'
    }
    }
    stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t swathivullachi/swathi-maven-docker-project:%BUILD_NUMBER% .'
                }
            }
        }
    stage('Push image to Hub'){
            steps{
                script{
                      withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                      bat 'docker login -u swathivullachi -p Docker@123'
                   }
                   bat 'docker push swathivullachi/swathi-maven-docker-project:%BUILD_NUMBER%'

                }
                }
            }
        }
}
