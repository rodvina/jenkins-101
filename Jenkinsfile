pipeline {
   agent any
   stages {
    stage('Build') {
        steps {
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
   }
   
}