pipeline{
    agent any
    triggers {
        pollSCM '* * * * *'
        }
    stages{
        stage("deploy container"){
            steps{
		     withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh "ansible-playbook --private-key /var/lib/jenkins/.ssh/id_rsa -i inventory -u ansible playbook.yaml -e JOB_NAME=$JOB_NAME -e BUILD_NUMBER=$BUILD_NUMBER -e username=$username -e password=$password"
            }
         }
       }
    }
}

