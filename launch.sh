#!/bin/bash


DATABASE=AUTISSIER
tomcat=tomcat/webapps/
warfile=autissier

echo "[*] Shuting down and removing previous containers...";
sudo docker-compose down
echo "[*] Erasing previous tomcat sources files...";
# Generating warfile using the specific database name.
rm -rf $tomcat$warfile
rm $tomcat$warfile.war
mkdir $tomcat$warfile
cd build
# infra cfg
echo "Adapt adapt_this dir to overwrite src file..";
sed s/\<DATABASE\>/$DATABASE/g adapt_this/docker-compose.yml.bak > ../docker-compose.yml
sed s/\<DATABASE\>/$DATABASE/g adapt_this/mysql-init.sql.bak > ../db/mysql-init.sql
# Webapp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/list.jsp.bak > src/list.jsp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/userSafe.jsp.bak > src/userSafe.jsp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/userUnsafe.jsp.bak > src/userUnsafe.jsp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/createUser.jsp.bak > src/createUser.jsp
sed s/\<DATABASE\>/$DATABASE/g adapt_this/list_patch.jsp.bak > src/list_patch.jsp
cd src
echo "Making $warfile.war from src...";
jar -cvf $warfile.war *
cp $warfile.war ../../$tomcat
mv $warfile.war ../../
cd ../..

echo "[*] Copy conf files from src to tomcat conf...";
cp -r build/src/tomcat/conf tomcat/
echo "[*] Starting new containers...";
sudo docker-compose up --build --remove-orphans -d

echo "[*] Erasing previous warfiles...";
cd $tomcat
rm -rf *
cd -
echo "[*] Upload new warfile to share directory"
mv $warfile.war $tomcat/
