pipeline {
   agent any
   stages {
    stage('Build') {
        // Run the maven build
        if (isUnix()) {
            // sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
            chmod 744 ./myscript.sh
        } else {
            bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
        }
    }
    stage('Run') {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '9ef7f06b-f7a6-4a2f-ad22-e00aff750b9d',
        usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            echo 'uname=$USERNAME pwd=$PASSWORD'
            ./myscript.sh ${params.env} $USERNAME:$PASSWORD 2>&1 | tee -a output.txt
            echo '${params.env}'
        }

    }
   }
   
}