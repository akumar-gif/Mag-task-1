pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-secret')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-secret	')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

    stage('Terraform Init') {
        steps {
              
            script {
                    sh 'terraform init'
                }
            }
        }

        

    stage('Terraform Plan') {
        steps {
               
            script {
                    sh 'terraform plan'
                }
            }
        }
    
    

    stage('Terraform Apply') {
        steps {
            
            script {
                    sh 'terraform apply'
                }
            }
        }
    }
}