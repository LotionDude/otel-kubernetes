k8s_namespace('default')
k8s_yaml([
  'k8s/deployment.yaml',
  'k8s/service.yaml',
  'k8s/configmap.yaml',
  'k8s/rbac.yaml',
])

k8s_resource('simple-project', port_forwards=['8080:8080', '5005:5005'])

print('Using kube context: ' + str(k8s_context()))
