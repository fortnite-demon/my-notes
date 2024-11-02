```openssl genrsa -out node_exporter.key 4096```  

```openssl req -new -key node_exporter.key -out node_exporter.csr -config req.conf -extensions 'v3_req'```  

```openssl x509 -req -days 365 -in node_exporter.csr -CA ca.crt -CAkey ca.key -set_serial 1 -extensions 'v3_req' -extfile req.conf -out node_exporter.crt```