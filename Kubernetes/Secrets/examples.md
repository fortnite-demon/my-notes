Opaque Secret:
```yml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: cGFzc3dvcmQK # Закодированные в base64 значние
  password: dXNlcm5hbWUK
```

Service Account Token Secret
```yml
apiVersion: v1
kind: Secret
metadata:
  name: build-robot-secret
  annotations:
    kubernetes.io/service-account.name: build-robot
type: kubernetes.io/service-account-token
```

Docker Config Secret
```yml
apiVersion: v1
kind: Secret
metadata:
  name: my-docker-config
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: eyJhdXRocyI6IHsiZG9ja2VyLmlvIjogeyJ1c2VybmFtZSI6ICJ1c2VyIiwgInBhc3N3b3JkIjogInBhc3N3b3JkIn19fQ==  # {"auths": {"docker.io": {"username": "user", "password": "password"}}} в base64 
```

Basic Authentication Secret
```yml
apiVersion: v1
kind: Secret
metadata:
  name: my-basic-auth
type: kubernetes.io/basic-auth
data:
  username: YWRtaW4=  # admin в base64
  password: cGFzc3dvcmQ=  # password в base64 
```

SSH Authentication Secret
```yml
apiVersion: v1
kind: Secret
metadata:
  name: my-ssh-key
type: kubernetes.io/ssh-auth
data:
  ssh-privatekey: LS0tLS1CRUdJTiB...  # Приватный ключ в base64 
```

TLS Secret
```yml
apiVersion: v1
kind: Secret
metadata:
  name: my-tls-secret
type: kubernetes.io/tls
data:
  tls.crt: <base64 encoded cert>
  tls.key: <base64 encoded key> 
```

Bootstrap Token Secret
```yml
apiVersion: v1
kind: Secret
metadata:
  name: bootstrap-token-abcdef
type: bootstrap.kubernetes.io/token
data:
  token-id: YWJjZGVm
  token-secret: MDEyMzQ1Njc4OWFiY2RlZg==
  usage-bootstrap-authentication: dHJ1ZQ==
  usage-bootstrap-signing: dHJ1ZQ==
```
