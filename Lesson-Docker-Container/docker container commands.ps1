docker container  ls

# List of all containers even the liked one
docker container  ls -a


# -it means interactive
# -p means port. The second 5000 port is the port, which is assigned to flask.
# -e means environment
# --rm means remove the container automatically after it's stopped
# -e means environment
docker container run -it --rm --name mycontainername -p 5000:80 -e FLASK_APP=app.py web1

# run in dettached mode
# --restart on-failure good for production
docker container run -it --rm --name mycontainername -p 5000:80 -e FLASK_APP=app.py -d --restart on-failure web1

# see the log of the container
docker container logs mycontainername

# see the log of the container in the real time
docker container logs -f mycontainername
    
# matrix of real stats
docker container stats

# remove container 
docker container rm contaier-name

docker container stop contaier-name