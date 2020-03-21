#!/bin/bash


DATABASE=AUTISSIER
tomcat=tomcat/webapps/
warfile=autissier.war

cd build
# infra cfg
sed s/\<DATABASE\>/$DATABASE/g adapt_this/docker-compose.yml.bak > ../docker-compose.yml
sed s/\<DATABASE\>/$DATABASE/g adapt_this/mysql-init.sql.bak > ../db/mysql-init.sql
# Webapp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/list.jsp.bak > src/list.jsp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/userSafe.jsp.bak > src/userSafe.jsp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/userUnsafe.jsp.bak > src/userUnsafe.jsp
cd src
jar -cvf $warfile *
mv $warfile ../../$tomcat
cd ../..

sudo docker-compose rm
sudo docker-compose up --build --remove-orphans