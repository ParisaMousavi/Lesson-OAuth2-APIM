docker container  ls

# List of all containers even the liked one
docker container  ls -a


# -it means interactive
# -p means port. The second 5000 port is the port, which is assigned to flask.
# -e means environment
# --rm means remove the container automatically after it's stopped
docker container run -it --rm -p 5000:5000 -e FLASK_APP=app.py web1

# remove container 
docker container rm <first four character of the container id>
