pipeline {
    agent any

    environment {
        IMAGE_NAME = "simple-flask-webapp"
        CONTAINER_NAME = "simple-flask-web-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/walterwhite662/simpl-flask-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop and Remove Existing Container (if any)') {
            steps {
                script {
                    bat "docker rm -f $CONTAINER_NAME || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo "✅ Flask App deployed successfully at http://<your-server-ip>:5000"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
