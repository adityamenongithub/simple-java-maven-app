pipeline
{
   agent any
   stages 
   {
    def mvnhome = tool name: 'maven-3', type: 'maven' 
	def mvncmd = "${mvnhome}/bin/mvn"
	
   	stage('Build')
	{
		steps
		{
			sh "${mvncmd} compile"	
		}
	}

	stage('UnitTest')
	{
		steps
		{
			sh "${mvncmd} compile"	
		}
	}

	stage('CreateArtifact')
	{
		steps
		{
			sh "${mvncmd} package"
		}
	}


	stage('CreateDockerImage')
	{
		steps
		{
			echo "Create the Docker image"
		}
	}

	stage('RollOutTheNewDockerImage')
	{
		echo "Rollout with Kubernetes !!!!"

	}
   }


}
