pipeline {
    agent any


    stages {
        stage('Checkout GIT') {
            steps {
                echo 'Pulling...'
                git branch: 'RaedGuesmi-5NIDS2-G9', url: 'https://github.com/raedgs/5NIDS2-G9-validation.git'
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
                 withSonarQubeEnv(installationName: 'sq'){
                sh 'mvn sonar:sonar -Dsonar.login=squ_55901a5704aecca6f4cc50192598abdb7743fa1f'
            }
            }
        }
        stage('Deploy to Nexus') {
            steps {
               
                sh 'mvn deploy -DskipTests'  // Déployer sur Nexus en sautant les tests
            }
            
        }


        stage('Build Spring Application') {
            steps {
                sh "mvn clean package"  // Exemple pour construire avec Maven
                // Vous pouvez personnaliser cette étape pour votre processus de construction (ex. Gradle).
            }
        }



    }
}
