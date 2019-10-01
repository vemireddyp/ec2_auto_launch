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
               withAWS(credentials: 'AWS-staging') {
           // sh "terraform init"
                 bat "terraform init"
                 bat "terraform plan"
                 bat "terraform apply -auto-approve"
		 sleep(300)      
          } 
        }
	}
	stage('configure IIS') {
	     steps {
	          withAWS(credentials: 'AWS-Keys') {
	          bat 'aws s3 cp terraform.tfstate s3://iispublishing/terraform.tfstate'		  
	        //  bat 'aws s3 cp "s3://iispublishing/websitehostings.ps1" websitehostings.ps1'
	         // bat 'aws s3 cp "s3://iispublishing/filecopy.ps1" filecopy.ps1'
                 // bat 'aws s3 cp "s3://iispublishing/hosts" hosts'
                  //bat 'aws s3 cp "s3://iispublishing/Intamac Root CA.cer" "Intamac Root CA.cer"'
                  //bat 'aws s3 cp "s3://iispublishing/SprueIDS1.pfx" SprueIDS1.pfx'
		  //bat 'aws s3 cp "s3://iispublishing/websiteinitialize.ps1" websiteinitialize.ps1'	  
	          }
	        //  bat 'powershell.exe ./filecopy.ps1 %IISPASSWORD%'
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
	/*post { 
           always { 
             cleanWs()
           }
        }*/

  

  
