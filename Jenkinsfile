pipeline{
    agent any
    tools{
        jdk 'jdk17'
        terraform 'terraform'
    }
    stages{
        stage('clean Workspace'){
            steps{
                cleanWs()
            }
        }
        stage('checkout from Git'){
            steps{
                git branch: 'main', url: 'https://github.com/Jadhavprachi/JENKINS_CICD.git'
            }
        }
        stage('Terraform version'){
             steps{
                 sh 'terraform --version'
                }
        }
        stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('sonar server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Terraform \
                    -Dsonar.projectKey=Terraform '''
                }
            }
        }
      
       
       
        
        
       
    }
}
