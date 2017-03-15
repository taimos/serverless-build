node {
    def version
    stage('Preparation') {
        checkout scm
        version = sh(script: 'git rev-list --all --count', returnStdout: true).trim()
        echo "Building version ${version}"
        sh 'docker pull mhart/alpine-node:latest'
    }
    stage('Build') {
        echo "Building version ${version}"
        sh "docker build -t taimos/serverless-build:${version} ."
    }
    stage('Publish') {
        sh "docker tag taimos/serverless-build:${version} taimos/serverless-build:latest"
        sh "docker push taimos/serverless-build:${version}"
        sh "docker push taimos/serverless-build:latest"
    }
}