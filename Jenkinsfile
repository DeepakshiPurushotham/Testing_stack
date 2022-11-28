pipeline {
    agent any
parameters {
  choice choices: ['development', 'testing', 'CML_Development'], name: 'environment'
  choice choices: ['stack_1', 'stack_2', 'stack_3', 'stack_4'], name: 'target'
}

    stages {
        stage('Git_clone') {
            steps {
                git branch: 'main', url: 'https://github.com/DeepakshiPurushotham/Testing_stack.git'
            }
        }
        stage('TF_init') {
            steps {
                sh 'terraform -chdir="./resource" init'
            }
        }
        stage('TF_plan') {
            steps {
                sh 'terraform -chdir="./resource" plan -var-file="../vars/${environment}.tfvars"'
            }
        }
        stage('TF_apply') {
            steps {
               //sh 'terraform -chdir="./resource" apply -var-file="../vars/${environment}.tfvars" -target=module.${target}'
            sh 'terraform -chdir="./resource" apply -var-file="../vars/${environment}.tfvars" --auto-approve'
                
            }
        }
      /*stage('TF_destroy') {
            steps {
            sh 'terraform -chdir="./resource" destroy -var-file="../vars/${environment}.tfvars" -target=module.${target} --auto-approve'
                
            }
        }*/
    }
}