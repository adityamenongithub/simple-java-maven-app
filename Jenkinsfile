def mvnhome
def mvncmd
node
{
	
   	stage('Build')
	{
		mvnhome = tool name: 'maven-3', type: 'maven' 
		mvncmd = "${mvnhome}/bin/mvn"	
		sh "echo 'Hi'"	
	}

	stage('UnitTest')
	{
		sh "${mvncmd} compile"	
	}

	stage('CreateArtifact')
	{
		sh "${mvncmd} package"
	}


	stage('CreateDockerImage')
	{
		echo "Create the Docker image"
	}

	stage('RollOutTheNewDockerImage')
	{
		echo "Rollout with Kubernetes !!!!"
	}
   
}
