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
	
    
        stage('initialize') {
          steps {
            
               withAWS(credentials: 'AWS-PRODUCTION-KEYS') {
          
                 bat "terraform init"
                 bat "terraform plan"
                 bat "terraform apply -auto-approve"
	   
          } 
        }
	}
	
		
		
    }
}

  

  
