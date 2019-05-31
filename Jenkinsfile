def mvnhome
def mvncmd
def branch
 
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
	
	stage('Deploy')
	{
	    branch=env.BRANCH_NAME
	    if ("${branch}" == "develop")
	    {
	        echo "Deploying to develop "
	        sshagent(['dockerhost']) {
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@ec2-35-166-249-54.us-west-2.compute.amazonaws.com docker run -d amenon/simple-java-maven-app:1.0'
            }
	        
	    }
	}
   
}
