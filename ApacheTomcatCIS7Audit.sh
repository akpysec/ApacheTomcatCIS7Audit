
echo "Enter WEB-APP Name";
read appname;
echo "Enter LOG location";
read loglocation;


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "1 Remove Extraneous Resources" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "1.1 Remove extraneous files and directories (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
ls -l $CATALINA_HOME/webapps/js-examplesexamples \
$CATALINA_HOME/webapps/servlet-example \
$CATALINA_HOME/webapps/webdav \
$CATALINA_HOME/webapps/tomcat-docs \
$CATALINA_HOME/webapps/balancer \
$CATALINA_HOME/webapps/ROOT/admin \
$CATALINA_HOME/webapps/examples \
$CATALINA_HOME/server/webapps/host-manager \
$CATALINA_HOME/server/webapps/manager \
$CATALINA_HOME/conf/Catalina/localhost/host-manager.xml \
$CATALINA_HOME/conf/Catalina/localhost/manager.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No extraneous files & directories found - PASS' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "1.2 Disable Unused Connectors (Not Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "Connector" $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2 Limit Server Platform Information Leaks" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2.1 Alter the Advertised server.info String (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/lib
jar xf catalina.jar org/apache/catalina/util/ServerInfo.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep server.info org/apache/catalina/util/ServerInfo.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2.2 Alter the Advertised server.number String (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/lib
jar xf catalina.jar org/apache/catalina/util/ServerInfo.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep server.number org/apache/catalina/util/ServerInfo.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2.3 Alter the Advertised server.built Date (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/lib
jar xf catalina.jar org/apache/catalina/util/ServerInfo.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep server.built org/apache/catalina/util/ServerInfo.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2.4 Disable X-Powered-By HTTP Header and Rename the Server Value for all Connectors (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Manual Check" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2.5 Disable client facing Stack Traces (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Manual Check" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "2.6 Turn off TRACE (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Manual Check" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "3 Protect the Shutdown Port" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "3.1 Set a nondeterministic Shutdown command value (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf
grep 'shutdown[[:space:]]*=[[:space:]]*"SHUTDOWN"' server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "3.2 Disable the Shutdown port (Not Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
grep '<Server[[:space:]]\+[^>]*port[[:space:]]*=[[:space:]]*"-1"' server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4 Protect Tomcat Configurations" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.1 Restrict access to $CATALINA_HOME (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME
find . -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.2 Restrict access to $CATALINA_BASE (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_BASE
find . -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.3 Restrict access to Tomcat configuration directory (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf
find . -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.4 Restrict access to Tomcat logs directory (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME
find logs -follow -maxdepth 0 \( -perm /o+rwx -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.5 Restrict access to Tomcat temp directory (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME
find temp -follow -maxdepth 0 \( -perm /o+rwx -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.6 Restrict access to Tomcat binaries directory (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME
find bin -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.7 Restrict access to Tomcat web application directory (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME
find webapps -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.8 Restrict access to Tomcat catalina.policy (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find catalina.policy -follow -maxdepth 0 \( -perm /o+rwx -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.9 Restrict access to Tomcat catalina.properties (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find catalina.properties -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.10 Restrict access to Tomcat context.xml (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find context.xml -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.11 Restrict access to Tomcat logging.properties (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find logging.properties -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.12 Restrict access to Tomcat server.xml (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find server.xml -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.13 Restrict access to Tomcat tomcat-users.xml (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find tomcat-users.xml -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "4.14 Restrict access to Tomcat web.xml (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cd $CATALINA_HOME/conf/
find web.xml -follow -maxdepth 0 \( -perm /o+rwx,g=w -o ! -user tomcat_admin -o ! -group tomcat \) -ls | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "5 Configure Realms" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "5.1 Use secure Realms (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "Realm className" $CATALINA_HOME/conf/server.xml | grep MemoryRealm | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "Realm className" $CATALINA_HOME/conf/server.xml | grep JDBCRealm | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "Realm className" $CATALINA_HOME/conf/server.xml | grep UserDatabaseRealm | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "Realm className" $CATALINA_HOME/conf/server.xml | grep JAASRealm | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "5.2 Use LockOut Realms (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "LockOutRealm" $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "6 Connector Security" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "6.1 Setup Client-cert Authentication (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Review the Connector configuration in server.xml and ensure the clientAuth parameter is set to true." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "6.2 Ensure SSLEnabled is set to True for Sensitive Connectors (Not Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Review server.xml and ensure all Connectors sending or receiving sensitive information have the SSLEnabled attribute set to true." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "6.3 Ensure scheme is set accurately (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Review server.xml to ensure the Connector’s scheme attribute is set to http for Connectors operating over HTTP." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Also ensure the Connector’s scheme attribute is set to https for Connectors operating over HTTPS." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "6.4 Ensure secure is set to true only for SSL-enabled Connectors (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Review server.xml and ensure the secure attribute is set to true for those Connectors having SSLEnabled set to true." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Also, ensure the secure attribute set to false for those Connectors having SSLEnabled set to false." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "6.5 Ensure SSL Protocol is set to TLS for Secure Connectors (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "The TLS protocol does not contain weaknesses that affect other secure transport protocols, such as SSLv1 or SSLv2." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Therefore, TLS is leveraged to protect the confidentiality and integrity of data while in transit." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "server.xml Export" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME/conf/server.xml >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt





echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7 Establish and Protect Logging Facilities" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.1 Application specific logging (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Manual Check" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.2 Specify file handler in logging.properties files (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep handlers $CATALINA_BASE\webapps\/$appname\WEB-INF\classes\logging.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep handlers $CATALINA_BASE\conf\logging.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.3 Ensure className is set correctly in context.xml (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep org.apache.catalina.valves.AccessLogValve $CATALINA_BASE\webapps\/$appname\META-INF\context.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.4 Ensure directory in context.xml is a secure location (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep directory context.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
ls –ld $loglocation
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.5 Ensure pattern in context.xml is correct (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep pattern context.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.6 Ensure directory in logging.properties is a secure location (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep directory logging.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
ls –ld $loglocation | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "7.7 Configure log file size limit (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Validate the max file limit is not greater than the size of the partition where the log files are stored." >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check: directory logging.properties - java.util.logging.FileHandler.limit=10000" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "8 Configure Catalina Policy" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "8.1 Restrict runtime access to sensitive packages (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for: package.access = sun.,org.apache.catalina.,org.apache.coyote.,org.apache.tomcat.,org.apache.jasper" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_BASE/conf/catalina.properties | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "9 Application Deployment" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "9.1 Starting Tomcat with Security Manager (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check that Tomcat started with '-security' option" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat /etc/init.d | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "9.2 Disabling auto deployment of applications (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Ensure autoDeploy is set to false" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "autoDeploy" $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "9.3 Disable deploy on startup of applications (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Ensure deployOnStartup is set to false" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep "deployOnStartup" $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10 Miscellaneous Configuration Settings" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.1 Ensure Web content directory is on a separate partition from the Tomcat system files (Not Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
df $CATALINA_HOME/webapps | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
df $CATALINA_HOME/ | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.2 Restrict access to the web administration (Not Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check that RemoteAddrValve option is uncommented and configured to only allow access to systems required to connect" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.4 Force SSL when accessing the manager application (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for the <transport-guarantee> attribute set to CONFIDENTIAL" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep transport-guarantee $CATALINA_HOME/webapps/manager/WEB-INF/web.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.5 Rename the manager application (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME/conf/Catalina/localhost/manager.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found - PASS' >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME/webapps/host-manager/manager.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found - PASS' >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME/webapps/manager | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found - PASS' >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME/webapps/manager | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found - PASS' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.6-9 Checks in catalina.sh" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.6 Enable strict servlet Compliance (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for STRICT_SERVLET_COMPLIANCE parameter is set to true" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.7 Turn off session facade recycling (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for RECYCLE_FACADES parameter is set to true" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.8 Do not allow additional path delimiters (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for ALLOW_BACKSLASH and ALLOW_ENCODED_SLASH parameters are set to false" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.9 Do not allow custom header status messages (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for USE_CUSTOM_STATUS_MSG_IN_HEADER parameter is set to false" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_HOME\bin\catalina.sh | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.10 Configure connectionTimeout (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for connectionTimeout='60000'" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep connectionTimeout $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.11 Configure maxHttpHeaderSize (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for maxHttpHeaderSize is set to 8192" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep maxHttpHeaderSize $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.12 Force SSL for all applications (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for <transport-guarantee>CONFIDENTIAL</transport-guarantee> attribute" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep transport-guarantee $CATALINA_HOME/conf/web.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.13 Do not allow symbolic linking (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
find . -name context.xml | xargs grep "allowLinking" | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.14 Do not run applications as privileged (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
find . -name context.xml | xargs grep "privileged" | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.15 Do not allow cross context requests (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
find . -name context.xml | xargs grep "crossContext" | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.16 Do not resolve hosts on logging valves (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
grep enableLookups $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.17 Enable memory leak listener (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check for org.apache.catalina.core.JreMemoryLeakPreventionListener, uncomment if diabled"
cat $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.18 Setting Security Liftcycle Listener (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Check at <Listener className='org.apache.catalina.security.SecurityListener' checkedOsUsers='alex,bob' minimumUmask='0007' />"
cat $CATALINA_HOME/conf/server.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt


echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "10.19 use the logEffectiveWebXml and metadata-complete settings for deploying applications in production (Scored)" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "Determine if the metadata-complete and logEffectiveWebXml property is set to true" >> SEC_AUDIT_APACHE_TOMCAT7.txt
cat $CATALINA_BASE\webapps\/$appname\WEB-INF\web.xml | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt

echo "**************************************************************************************************************************" >> SEC_AUDIT_RHEL7.txt 
echo "11 Custom Twerks" >> SEC_AUDIT_RHEL7.txt
echo "**************************************************************************************************************************" >> SEC_AUDIT_RHEL7.txt 

echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "11.1 Dump all vhosts and their config files" >> SEC_AUDIT_RHEL7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
apachectl -D DUMP_VHOSTS | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt

echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "11.1 Show all loaded Apache modules" >> SEC_AUDIT_RHEL7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
apachectl -D DUMP_MODULES | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt

echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "11.1 Show main configuration directives (without vhosts)" >> SEC_AUDIT_RHEL7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
apachectl -D DUMP_RUN_CFG | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt

echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "11.1 Summary: show everything at once" >> SEC_AUDIT_RHEL7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
apachectl -S; apachectl -M | grep . >> SEC_AUDIT_APACHE_TOMCAT7.txt || echo 'No Value found' >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "--------------------------------------------------------------------------------------------------------------------------" >> SEC_AUDIT_APACHE_TOMCAT7.txt
echo "" >> SEC_AUDIT_APACHE_TOMCAT7.txt

