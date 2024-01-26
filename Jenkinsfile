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
                withAWS(credentials: 'aws-credentials', region: 'us-east-1'){
                script {
                    
                        sh 'terraform init'
                    }
                }
            }
        }
        

        stage('Terraform Plan') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'us-east-1'){
                script {
                    
                        sh 'terraform plan'
                    }
                }
            }
        }
        

        stage('Terraform Apply') {
            steps {
                script {
                    withAWS(credentials: 'aws-credentials', region: 'us-east-1') {
                        sh 'terraform apply -input=false -auto-approve tfplan'
                    }
                }
            }
        }
    }
}