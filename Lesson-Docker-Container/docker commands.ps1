docker --help

# the dockerfile will be used automatically if it exists
# Point(.) at the end means image is created in the root
# -t means --tag
docker image build --tag web1 .
# both are the same
docker image build -t web1 .
# dockerfile path can be specifies
docker image build -t web1 --file .\[path]\Dockerfile .
# both are the same
docker image build -t web1 -file .\[path]\Dockerfile .

# Inspect docker image via tag
docker image inspect web1

# Build a new docker image with tag version
docker image build -t web1:1.0 .

# List of images
docker image ls

# login to docker hub
# Windows : %USERPROFILE%/.docker/config.json 
# Linux : ~/.docker/config.json
docker login


# remove a docker image
docker image rm web1:1.0

# tag the docker image. Tag format must be [username/repository:tag]
docker image tag web1 parisadocker/web1

# push the taged image [username/repository:tag]
docker image push parisadocker/web1:latest