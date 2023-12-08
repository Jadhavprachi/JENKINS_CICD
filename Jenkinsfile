pipeline{
    agent any
    tools{
        jdk 'jdk17'
        terraform 'terraform'
    }
     environment {
        SCANNER_HOME=tool 'sonar-scanner'
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
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/soanar-scanner -Dsonar.projectName=terraform \
                    -Dsonar.projectKey=terraform '''
                }
            }
        }
        stage("quality gate"){
           steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token' 
                }
            } 
        }
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
       
       
        
        
       
    }
}
