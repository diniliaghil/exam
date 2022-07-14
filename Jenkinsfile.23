pipeline{
    agent any
    triggers {
        pollSCM '* * * * *'
        }
    stages{
        stage("build"){
            steps{
                sh "docker build -t deinmaarnix/$JOB_NAME:$BUILD_NUMBER ."
            }
        }
        stage("delpoy image to registry"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "docker login -u $username -p $password"
                    sh "docker push deinmaarnix/$JOB_NAME:$BUILD_NUMBER"
                }
            }
        }
    }
}
