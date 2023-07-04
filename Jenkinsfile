pipeline {
    agent any
    environment {
        registry = "ahmedmohsen98/vp-app"
        registryCredential = 'dockerhub'
        scannerHome = tool 'Sonar'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean install'
                archiveArtifacts artifacts: 'target/**', fingerprint: true
            }
        }
        stage('Unit Test') {
            steps {
                sh 'mvn -B test'
            }
        }
        stage('Integration Test') {
            steps {
                sh 'mvn -B integration-test'
            }
        }
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                }
            }
            }
        stage('Publish Docker Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
              }
            }
          }
                }
        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
        }
        stage('Kubernetes Deploy') {
	        agent { label 'KOPS' }
                steps {
                    sh "cd Devops-Project"
                    sh "git pull"
                    sh "cd Devops-Project/kubernetes/"
                    sh "kubectl apply -f configmap.yaml"
                    sh "kubectl apply -f secret.yaml"
                    sh "kubectl apply -f mysql.yaml"
                    sh "kubectl apply -f memc.yaml"
                    sh "kubectl apply -f rabmq.yaml"
                    sh "kubectl apply -f vp-app.yaml"
                    sh "kubectl apply -f ingress.yaml"
            }
        }
            }
        }
        