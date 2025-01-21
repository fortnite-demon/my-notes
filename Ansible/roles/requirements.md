roles/requirements.yml

```yml
---
- src: oefenweb.ntp

- src: https://github.com/repo-owner/ansible-role-docker.git
  scm: git
  version: '5.0.0'
  name: repo-owner.docker

- src: https://github.com/fortnite-demon/role-nginx.git
  scm: git
  version: master
  name: nginx
```
