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
	    withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhubpassword')]) {
            
            sh "docker login -u amenon -p ${dockerhubpassword}"
        }
        sh "docker push amenon/simple-java-maven-app:1.0"
	}
   
}
