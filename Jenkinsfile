pipeline {
   agent any
   stages {
    stage('Build') {
        steps {
            script {
                currentBuild.displayName = "#"+env.BUILD_NUMBER+"["+params.env+"]"
            }
            // Run the maven build
            sh label: 'chmod', script: 'chmod 744 ./myscript.sh'
        }
    }
    stage('Run') {
        steps {
            withCredentials([usernamePassword(credentialsId: '9ef7f06b-f7a6-4a2f-ad22-e00aff750b9d', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                echo 'uname=$USERNAME pwd=$PASSWORD'
                sh label: 'run script', script: './myscript.sh params.env $USERNAME:$PASSWORD 2>&1 | tee -a output.txt'
            }
        }
    }
    stage('Commit') {
        steps {
            script {
                tagname = params.env + "_" + env.BUILD_NUMBER
            }
            //sh script: "git config --global --list"
            //sh script: "tagname=$params.env_$env.BUILD_NUMBER"
            sh script: "git tag -a $tagname -m'Jenkins output'"
            sh script: "git push --tags"
            
        }
    }
   }
   
}