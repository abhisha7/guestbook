pipeline {
    agent { node { label 'master' } }
    stages {
	
	
	    stage('Prepare') {
            steps {
			    
			
			    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/abhisha7/guestbook.git']]])
			}
        }
		stage('Build') {
			when {
        		// skip this stage unless on Master branch
        			branch "master"
     			}
			steps {
				sh 'mvn -B -DskipTests clean package'
				
						
			}
			post {
				success {
					archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
				}
			}				
		}
				
				
					 
		stage('Test') {
				
			steps {
					    
				sh 'mvn test'
			}	
	        post {
				success {
					sh '/var/jenkins_home/workspace/push.sh'
				}
			}				
			
		}	
        
	
		
					
    }
}
