# concourse-resource-kubernetes

## Example

```yml
resource_types:
- name: kubernetes
  type: docker-image
  source:
    repository: andrewrk/concourse-resource-kubernetes


resources:
- name: kubernetes-staging
  type: kubernetes
  source:
    cluster_url: https://99.99.99.99:443
    namespace: default
    cluster_ca: {{k8s-ca}}
    admin_key: {{k8s-key}}
    admin_cert: {{k8s-cert}}
    resource_type: deployment
    resource_name: my-resource
    container_name: my-container


jobs:
- name: deploy-okc
  plan:
  - put: kubernetes-staging
    params:
      image_name: my-image
      image_tag_file: digest
```
