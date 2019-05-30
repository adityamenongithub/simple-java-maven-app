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
		#ssh to the another server and create a docker image
		steps
		{
			echo "Create the Docker image"
		}
	}

	stage('RollOutTheNewDockerImage')
	{
		#Code for kubernetes to deploy the new code to all the docker environments
		echo "Rollout with Kubernetes !!!!"

	}
   }


}
