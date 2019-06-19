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
