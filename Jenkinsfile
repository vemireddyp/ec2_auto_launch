pipeline {
    agent any 
    stages {
      stage('checkout') {
          //  agent { docker 'maven:3-alpine' } 
            steps {
                checkout scm
               // sh 'mvn --version'
            }
        }
	/*stage('teraform-path') {
          //  agent { docker 'maven:3-alpine' } 
            steps {
		   // sh "cd /opt/bitnami/apps/jenkins/jenkins_home/workspace/test1/@script"
		    sh "terraform --version"
			           
		   
        }  
	}*/
    
        stage('initialize') {
          steps {
            sh "terraform init"		  
          } 
        }
        stage('plan') {
          steps {
           
            sh "terraform plan"
          }
		}  
        stage('apply') {
          steps {
           
            sh "terraform apply -auto-approve"
          }
         } 
	 
}
}
  

  
