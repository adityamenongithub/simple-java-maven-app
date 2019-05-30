FROM tomcat
ADD target/*.jar /usr/local/tomcat/webapps/
