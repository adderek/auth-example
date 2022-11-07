# auth-example
An example project with kong, some authentication methods and description just to show how it works and create a simple PoC

# To run
```
myComputer:~/src/auth-example$ docker run --rm -v $PWD:/home/node/auth-example --hostname build-auth-example -it node:18-alpine sh
/ # su node
/ $ cd /home/node/auth-example/dummy
~/auth-example/dummy $ npm install

added 57 packages, and audited 58 packages in 643ms

7 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
npm notice 
npm notice New patch version of npm available! 8.19.2 -> 8.19.3
npm notice Changelog: https://github.com/npm/cli/releases/tag/v8.19.3
npm notice Run npm install -g npm@8.19.3 to update!
npm notice 

~/auth-example/dummy $ exit
/ # exit
myComputer:~/src/auth-example$ docker-compose up
```

Then go to kong/kong.yml and read.
After you got enough try to send a request - use .sh scripts
If everything goes well then your request should be verified (correct HMAC) and headers should be passed to the "dummy" service.
It should NOT be possible to modify those headers - you would not be authenticated if those are modified.
