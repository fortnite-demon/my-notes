```openssl genrsa -out server.key 4096```  

```openssl req -new -key server.key -out server.csr -config req.conf -extensions 'v3_req'```  

```openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 1 -extensions 'v3_req' -extfile req.conf -out server.crt```
