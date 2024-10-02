CREATE USER 'root'@'%' IDENTIFIED BY 'root';
grant replication slave, replication client on *.* to 'root'@'%';
flush privileges;