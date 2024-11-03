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
CN = mearme.com
[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = monitoring.mearme.com
# Или можем также добавить, тогда server_name в prometheus указывать не придётся
IP.1 = 10.10.0.252
```

```server_name node_exporter.fortnite.com``` - Также нужно добавить в nginx (но работало и без него)
