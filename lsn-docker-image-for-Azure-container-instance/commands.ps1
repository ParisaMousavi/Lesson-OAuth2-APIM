# build container image
docker build ./aci-helloworld -t aci-tutorial-app

# run container locally
docker run -d -p 8080:80 aci-tutorial-app

