docker container run -it -p 5000:80 -e FLASK_APP=app.py --rm --name web2 -e FLASK_DEBUG=1 web2

# start the bash with container
docker container exec -it web2 bash

# execute a command on the running container to get the flask version
docker container exec -it web2 flask --version

# execute a command on the running container to create a file on the container
docker container exec -it web2 touch hi.txt


