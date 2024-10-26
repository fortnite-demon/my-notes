- ```file_sd_config``` - Кастомное обнаружение целей.  
- ```azure_sd_config``` - получение целей для мониторинга из облака Azure.  
- ```consul_sd_config``` - получение целей для мониторинга из системы хранения конфигураций consul.  
- ```digitalocean_sd_config``` - получение целей для мониторинга из облака digital ocean.  
- ```docker_sd_config``` - получение целей для мониторинга из docker engine, по сути из docker socket.  
- ```dockerswarm_sd_config``` - получение целей для мониторинга из кластера docker swarm. Тут так же используется docker socket.  
- ```dns_sd_config``` - получение информации о целях из DNS.  
- ```ec2_sd_config``` - получение информации о целях из Amazon EC2.  
- ```openstack_sd_config``` - получение информации о целях из Openstack.  
- ```file_sd_config``` - получение информации о целях из внешнего файла.  
- ```gce_sd_config``` - получение информации о целях из google cloud engine.  
- ```hetzner_sd_config``` - получение информации о целях из hetzner cloud.  
- ```kubernetes_sd_config``` - получение информации о целях из Kubernetes API.  

## Пример file_sd_config, где targets.json

```Json
[
    {
        "targets":[
            "localhost:9090",
            "10.1.1.2:9111"
        ],
        "labels":{
            "env":"prod"
        }
    }
]
```
