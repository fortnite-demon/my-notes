*root.hcl:*
```tf
locals {
  region_hcl = find_in_parent_folders("region.hcl")
  region = read_terragrunt_config(local.region_hcl).locals.region
}
```


### Чтобы открыть перменные в дочернем файле, можем использовать такой параметр:

*env/prod/vpc/terragrunt.hcl:*
```tf
include {
  path = find_in_parent_folders("root.hcl")
  expose = true
}
```
