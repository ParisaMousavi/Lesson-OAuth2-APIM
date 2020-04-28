# to get help about the docker-compose
docker-compose --help

# to build the images
docker-compose build

# to pull all the images our docker-compose needed
docker-compose pull

# to start the project
docker-compose up

docker-compose up --build -d

docker-compose ps

# real time logs of the containers
docker-compose logs -f

# to restart all the containers
docker-compose restart 

docker-compose restart containername

docker-compose run redis redis-server --version

docker-compose stop

docker-compose up redis





