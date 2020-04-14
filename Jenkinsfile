pipeline {
    agent { node { label 'agent1' } }
    stages {
	
	
	    stage('Prepare') {
            steps {
			    
			
			    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/abhisha7/guestbook.git']]])
			}
        }
		stage('Build and test') {
		
			parallel {
			
				stage('Build') {
					steps {
						sh 'mvn -B -DskipTests clean package'
					}
					post {
						success {
							archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
						}
					}				
				}
				
				stage('Prompt for deploy') {
					
					steps {
						input 'Deploy this?'
					}
				}	
					 
				stage('Test') {
					
					steps {
					    
						sh 'mvn test'
						publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
					}
					post {
						always {
							junit 'target/surefire-reports/*.xml'
						}
					}	
				}
			}
		}	

        

        
    }
}
