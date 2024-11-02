```
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
C = RU
ST = Moscow
L = Moscow
O = Company
OU = IT
CN = node_exporter.fortnite.com
[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = node_exporter.fortnite.com
```

```server_name node_exporter.fortnite.com``` - Также нужно добавить в nginx
