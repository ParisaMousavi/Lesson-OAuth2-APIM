
# install npm on linux to get ready for postman-to-k6
https://www.devroom.io/2011/10/24/installing-node-js-and-npm-on-ubuntu-debian/


# to run a .sh file
./install.sh

# solve permission deny in linux debian
chmod +x install.sh

# load test with postman and K6
https://k6.io/blog/load-testing-with-postman-collections


postman-to-k6 gPAS.postman_collection.json -i 1000 -o k6-script.js