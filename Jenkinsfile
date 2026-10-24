pipeline{
    agent any
    environment{
        TF_WORKDIR = "environments/${env.BRANCH_NAME}"
    }
    stages{
        stage('checkout'){
            steps{
                git branch: "${env.BRANCH_NAME}", url:'https://github.com/aravindrajsaravanan/Infra-Pipeline.git'
            }
        }
        stage ('Terraform init'){
            steps{
                dir(env.TF_WORKDIR){
                    sh 'terraform init'
                }
            }
        }
        stage ('Terraform plan'){
            steps{
                dir(env.TF_WORKDIR){
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -no-color tfplan>tfplan.txt'
                    sh 'cat tfplan.txt'
                }
            }
        }
        stage ('Approve'){
            when{
                expression {env.BRANCH_NAME == 'prod'}
            }
            steps{
                input message: "approve the deployment to production?", ok: 'Deploy'
            }
        }
        stage('apply'){
            steps{
                dir(env.TF_WORKDIR){
                    sh 'terraform apply tfplan'
                }
            }
        }
    }
}