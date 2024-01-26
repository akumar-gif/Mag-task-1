pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-secret')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-secret')
    }

    parameters {
        choice(
            choices: ['apply', 'destroy'],
            description: 'Terraform action to apply or destroy',
            name: 'action'
            )
        
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
                if(params.action == 'apply'){
                    sh 'terraform apply -auto-approve'
                } else if (params.action == 'destroy') {
                    sh 'terraform destroy -auto-approve'
                }
            }
            }
        }
    }
}