# Prometheus
This will give you the easy installation of the Prometheus and Alertmanager deployment 

To add this repo in your local helm repo 
```
helm repo add prom https://mohanagandlla.github.io/prometheus/
helm repo update
```
Pre-requesites:
  Prometheus operator > 0.44.0 deployed in your cluster along with CRDS
  if not operator deployed then folllow the link
  https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
