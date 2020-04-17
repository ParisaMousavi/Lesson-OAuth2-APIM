docker pull mysql

docker run --name testmysql -e MYSQL_ROOT_PASSWORD=parisa -d mysql

docker logs testmysql

docker container ls -a

# Connecting to MySQL Server from within the Container
docker exec -it testmysql mysql -u root -p

# mysql> Prompt
# Create a database
CREATE DATABASE db_name;

# List the databases
SHOW databases;