pipeline {
    agent any


    stages {
        stage('SCM Checkout'){
          git 'https://github.com/pranikita/maven-project-1'
        }
  }
    {
        stage ('Compile Stage') {
        agent { label 'jenkins-slave' }
            steps {
                withMaven(maven : 'LocalMaven') {
                    sh 'mvn clean compile'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                withMaven(maven : 'LocalMaven') {
                    sh 'mvn test'
                }
            }
        }


        stage ('install Stage') {
            steps {
                withMaven(maven : 'LocalMaven') {
                    sh 'mvn install'
                }
            }
        }

        stage ('deploy to tomcat') {
             steps {
                 sshagent(['f39cd834-5e32-428e-965f-d6020b95c133']) {
                 sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@172.31.38.135:/var/lib/tomcat/webapps/'
      } 
}
}
    }
}
