const express = require('express')
const app = express()
const port = 80

app.get('/', (req, res) => {
  const json = {
    baseUrl: req.baseUrl,
    cookies: req.cookies,
    method: req.method,
    ip: req.ip,
    originalUrl: req.originalUrl,
    params: req.params,
    path: req.path,
    query: req.query,
    secure: req.secure,
    signedCookies: req.signedCookies,
    xhr: req.xhr,
    headers: {
        auth: req.get('authorization'),
        customerID: req.get('customerid')
    }
  };
  console.log('Incoming request', json);
  //CustomerID (1234)
  //X-Consumer-Custom-ID (custom-userid)
  //X-Consumer-Username (user-consumer)
  //X-Credential-Identifier (hmac-user)

  res.status(200)
    .json(json)
    .end();
})

process.on('SIGTERM', ()=>process.exit(0));

app.listen(port, () => {
  console.log(`Dummy listening on port ${port}`)
})

