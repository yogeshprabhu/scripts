

#Ambari
CREATE USER '<AMBARIUSER>'@'%' IDENTIFIED BY '<AMBARIPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<AMBARIUSER>'@'%';
CREATE USER '<AMBARIUSER>'@'localhost' IDENTIFIED BY '<AMBARIPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<AMBARIUSER>'@'localhost';
CREATE USER '<AMBARIUSER>'@'<AMBARISERVERFQDN>' IDENTIFIED BY '<AMBARIPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<AMBARIUSER>'@'<AMBARISERVERFQDN>';
FLUSH PRIVILEGES;

CREATE DATABASE <AMBARIDATABASE>;
USE <AMBARIDATABASE>;
SOURCE /var/lib/ambari-server/resources/Ambari-DDL-MySQL-CREATE.sql;


#hive

CREATE USER '<HIVEUSER>'@'localhost' IDENTIFIED BY '<HIVEPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<HIVEUSER>'@'localhost';
CREATE USER '<HIVEUSER>'@'%' IDENTIFIED BY '<HIVEPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<HIVEUSER>'@'%';
CREATE USER '<HIVEUSER>'@'<HIVEMETASTOREFQDN>' IDENTIFIED BY '<HIVEPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<HIVEUSER>'@'<HIVEMETASTOREFQDN>';
FLUSH PRIVILEGES;

CREATE DATABASE hive;


#oozie
CREATE USER '<OOZIEUSER>'@'%' IDENTIFIED BY '<OOZIEPASSWORD>';
GRANT ALL PRIVILEGES ON *.* TO '<OOZIEUSER>'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE <OOZIEDATABASE>


#ranger
#Setting up Database Users Without Sharing DBA Credentials
#https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.4/bk_security/content/setting_up_database_users_without_sharing_dba_credentials.html

CREATE USER 'rangerdba'@'localhost' IDENTIFIED BY 'rangerdba';
GRANT ALL PRIVILEGES ON *.* TO 'rangerdba'@'localhost';
CREATE USER 'rangerdba'@'%' IDENTIFIED BY 'rangerdba';
GRANT ALL PRIVILEGES ON *.* TO 'rangerdba'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'rangerdba'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'rangerdba'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;





sudo ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java.jar

