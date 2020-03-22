FROM tomcat:latest

ADD webapps/autissier.war /usr/local/tomcat/webapps
ADD conf/tomcat-users.xml /usr/local/tomcat/conf

CMD ["catalina.sh", "run"] 
