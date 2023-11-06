pipeline {
    agent any
    stages {
        stage('Checkout GIT') {
            steps {
                echo 'Pulling...'
                   git branch: 'RaedGuesmi-5NIDS2-G9', url: 'https://github.com/raedgs/5NIDS2-G9-validation'
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
                        sh 'docker build -t devops-integration/devops-integration .'
                }
            }
        
        }
        stage('docker hub'){
            steps{
                script{
                    sh 'docker tag devops-integration/devops-inetgration devops-integration/devops-inetgration'
                    sh 'docker login -u raed007 -p Weldelmo5'
                    sh 'docker push raed007/devops-inetgration'
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
