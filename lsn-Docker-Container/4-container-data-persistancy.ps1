# start redis 
# redis is typically an in-memory database
docker container run --rm -itd -p 6379:6379 --name redis --net firstnetwork redis:3.2-alpine

docker container run --rm -itd -p 5000:80 -e FLASK_APP=app.py -e FLASK_DEBUG=1 --name web2 --net firstnetwork web2 

# add volumn to docker
docker volume create web2_redis

docker volume ls

docker volume inspect web2_redis

# -v means volume data
docker container run --rm -itd -p 6379:6379 --name redis --net firstnetwork -v web2_redis:/data redis:3.2-alpine


