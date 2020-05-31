setup local mysql server:
cd db-docker
docker-compose up
docker-compose ps 

host: 'localhost',
user: 'root',
password: 'root',
port: '8306',
database: 'medicalAppDevV2',
multipleStatements: true