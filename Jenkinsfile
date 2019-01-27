pipeline {
   agent any
   stages {
    stage('Build') {
        // Run the maven build
        chmod 744 ./myscript.sh
    }
    stage('Run') {
        withCredentials([usernamePassword(credentialsId: '1f162214-505f-4ffb-bc2c-00ee2747efa5', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
            echo 'uname=$USERNAME pwd=$PASSWORD'
            ./myscript.sh ${params.env} $USERNAME:$PASSWORD 2>&1 | tee -a output.txt
            echo '${params.env}'
        }

    }
   }
   
}