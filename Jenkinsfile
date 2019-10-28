@Library('notification@master') _

pipeline {
  agent {
    node {
      label 'product-dev'
    }

  }

  options {
  	gitLabConnection('General Gitlab Auth')
  }

  stages {
  	/* skip testing because test cannot be performed */
    /*stage("Unit Test") {
      steps {
          gitlabCommitStatus(name: 'test') {
            sh 'mvn verify -Dmaven.test.failure.ignore=true -DargLine="-Dspring.profiles.active=test,no-liquibase"'
          }
        }
    }
    stage("SonarQube Analysis") {
      steps {
        script {
          def scannerHome = tool 'SonarQube'
          withSonarQubeEnv('SonarQube') {
            sh "${scannerHome}/bin/sonar-scanner"
          }
        }
      }
    }
    stage("SonarQube Quality Gate") {
      steps { 
        gitlabCommitStatus(name: 'analysis') {
          timeout(time: 1, unit: 'HOURS') {
             script {
                 def qg = waitForQualityGate()
                 if (qg.status != 'OK') {
                   error "Pipeline aborted due to quality gate failure: ${qg.status}"
                 }
             }
          }
        }
      }
    }*/
    stage("Build") {
      when {
          expression {
              return gitlabTargetBranch.startsWith('master') && gitlabTargetBranch.equals(gitlabSourceBranch)
          }
      }
      steps {
        gitlabCommitStatus(name: 'build') {
          sh 'mvn clean deploy -Dmaven.test.skip=true'
        }
      }
    }
  }
  post {
    always {
    	node("product-dev") {
    		notification currentBuild.result   
    	}
        // junit allowEmptyResults: true, testResults: '**/surefire-reports/*.xml'
    }
  }
}
