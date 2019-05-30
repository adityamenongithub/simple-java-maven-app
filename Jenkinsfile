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
		echo "Create the Docker image"
	}

	stage('RollOutTheNewDockerImage')
	{
		echo "Rollout with Kubernetes !!!!"
	}
   
}
