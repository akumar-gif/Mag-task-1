pipeline {
    agent any
    
    // environment {
       
    // }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                 withCredentials([
                    [string(credentialsId: 'my-aws', 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID')],
                    [string(credentialsId: 'my-aws', 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]
                    ]){
                script {
                    
                        sh 'terraform init'
                    }
                }
            }
        }
        

        stage('Terraform Plan') {
            steps {
                 withCredentials([
                    [string(credentialsId: 'my-aws', 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID')],
                    [string(credentialsId: 'my-aws', 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]
                    ]){
                script {
                        sh 'terraform plan'
                    }
                }
            }
        }
        

        stage('Terraform Apply') {
            steps {
                withCredentials([
                        [string(credentialsId: 'my-aws', 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID')],
                        [string(credentialsId: 'my-aws', 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')]
                    ])
                script {
                    {
                        sh 'terraform apply'
                    }
                }
            }
        }
    }
}