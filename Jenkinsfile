pipeline {
    agent any
    stages {
        stage('Checkout GIT') {
            steps {
                echo 'Pulling...'
                git branch: 'main', url: 'https://github.com/ghaith450/5NIDS2-G9-Projet1.git'
            }
        }
        stage('MVN CLEAN') {
            steps {
                // Nettoie le projet en utilisant Maven
                sh 'mvn clean'
            }
        }
        stage('MVN COMPILE') {
            steps {
                // Compile le projet en utilisant Maven
                sh 'mvn compile'
            }
        }
       
        stage('SonarQube Scan') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=squ_55901a5704aecca6f4cc50192598abdb7743fa1f'
            }
        }
        stage('Deploy to Nexus') {
            steps {
                sh 'mvn deploy -DskipTests'  // Déployer sur Nexus en sautant les tests
            }
          
        }
        
        stage('build docker image'){
            steps{
                script{
                        sh 'docker build -t ghaith90/5nids2-g9-projet1-1.0 .'
                }
            }
        
        }
        stage('docker hub'){
            steps{
                script{
                    sh 'docker tag ghaith90/5nids2-g9-projet1-1.0 ghaith90/5nids2-g9-projet1-1.0'
                    sh 'docker login -u ghaith90 -p Weldelmo5'
                    sh 'docker push ghaith90/5nids2-g9-projet1-1.0'
                }
            }
        }
          stage('docker compose'){
            steps{
                script{
                    sh 'docker volume create db '
                    sh 'docker volume create test '
                    sh 'docker compose up -d'
                }
            }
        }
    
       
        
       stage('Deploy Prometheus and Grafana') {
            steps {
                // Déployez Prometheus et Grafana en utilisant Docker Compose
                script {
                    sh 'docker run -d prom/prometheus '
                    sh 'docker run -d grafana/grafana'
                }
            }
        }
       
    }
       
        post{
          always{
            mail to: "raed.guesmi00@gmail.com",
            subject: "Test Email",
            body: "Test"
        }
    } 
    
        

}
