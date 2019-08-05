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
            //sh "terraform init"
               withAWS(credentials: 'AWS-Keys') {
           // sh "terraform init"
                 bat "terraform init"
                 bat "terraform plan"
                 bat "terraform apply -auto-approve" 		  
          } 
        }
	}
    }

       /* stage('plan') {
          steps {
             bat 'terraform plan'
           // sh "terraform plan"
          }
		}  
        stage('apply') {
          steps {
              bat 'terraform apply -auto-approve'
          //  sh "terraform apply -auto-approve"
          }
         } 
	 
}*/
}
  

  
