pipeline {
    agent any
    
    environment {
       
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
                    def tfHome = env.TF_HOME

                    withEnv(["TF_HOME=${tfHome}"]) {
                        sh 'terraform apply -input=false -auto-approve tfplan'
                    }
                }
            }
        }
    }
}

    // post {
    //     always {
    //         script {
    //             def tfHome = env.TF_HOME

    //             withEnv(["TF_HOME=${tfHome}"]) {
    //                 sh 'terraform destroy -input=false -auto-approve'
    //             }
    //         }
    //     }
    // }
