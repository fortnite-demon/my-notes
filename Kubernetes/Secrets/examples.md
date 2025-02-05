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
