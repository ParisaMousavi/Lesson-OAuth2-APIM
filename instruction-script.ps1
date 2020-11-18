# install Gulb to automate steps
# I use Powershell

# 1. first we need node.js installed
    node --version
    npm --version
    npx --version
    npm install -g npx

# 2. https://www.npmjs.com/package/gulp-cli
    npm i gulb-cli
    npm install --global gulp-cli
    # I tried many times with npm but couldn't install gulb and finally with choco I did it...
    choco install gulp-cli --version=2.3.0
    gulp --version
    npm install fsevents

# Get versions list
npm view <package-name> versions


yarn

 
