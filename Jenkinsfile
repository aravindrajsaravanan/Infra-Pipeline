pipeline{
    agent any
    environment{
        ENV="${env.BRANCH_NAME}"
        TF_WORDIR="environments/${env.BRANCH_NAME}"
    }
    stages{
        stage('checkout'){
            steps{
                git branch: "${env.BRANCH_NAME}", url:'https://github.com/aravindrajsaravanan/Infra-Pipeline.git'
            }
        }
        stage ('Terraform init'){
            steps{
                dir('${TF_WORDIR}'){
                    sh 'terraform init'
                }
            }
        }
        stage ('Terraform plan'){
            steps{
                dir('${TF_WORDIR}'){
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -no-color tfplan>tfplan.txt'
                    sh 'cat tfplan.txt'
                }
            }
        }
        stage ('Approve'){
            /*
            when{
                expression {env.BRANCH_NAME == 'production'}
            }*/
            steps{
                input message: "approvee the deployment to production?", ok: 'Deploy'
            }
        }
    }
}