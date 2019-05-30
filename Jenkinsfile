def mvnhome
def mvncmd
node
{
	
   	stage('Build')
	{
		mvnhome = tool name: 'maven-3', type: 'maven' 
		mvncmd = "${mvnhome}/bin/mvn"	
		sh "${mvncmd} compile"	
	}

	stage('UnitTest')
	{
		sh "${mvncmd} test"	
	}

	stage('CreateArtifact')
	{
		sh "${mvncmd} package"
	}
	stage('CreateDockerImage')
	{
		sh "docker build -t amenon/simple-java-maven-app:1.0 ."			
	}

	stage('PushDockerBuild')
	{
		withCredentials([usernameColonPassword(credentialsId: 'ac576d5b-aa1d-4578-9c85-348483972daf', variable: 'dockerhubcreds')]) {
		sh "docker login adi_menon@yahoo.com -p ${dockerhubcreds}"
		}
		sh "docker push amenon/simple-java-maven-app:1.0"
	}
   
}
