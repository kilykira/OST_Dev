module "ots_namespace" {
  source               = "./modules/terraform-k8s-namespace"
  name                 = "ots-ns"
}

module "app-deployer" {                                
  source = "./modules/terraform-helm-local"
  deployment_name        = "ots"
  deployment_namespace   = "ots-ns"
  deployment_path        = "charts/application"
  values_yaml = <<EOF

replicaCount: 1

# image:
#   repository:  "us-central1-docker.pkg.dev/terraform-project-kilyk/ots-project-repo/ots-image"
#   tag: "f7accfe08a5ca1cbc414a82d43ba0b7bda0bee34"



ingress:
  enabled: true
  
  annotations: 
    kubernetes.io/ingress.class: "nginx"
    ingress.kubernetes.io/ssl-redirect: "false"
    cert-manager.io/cluster-issuer: letsencrypt-prod
    acme.cert-manager.io/http01-edit-in-place: "true"
    
  hosts:
    - host: "ots.mykilyk.com"
      paths:
        - path: /
          pathType: Prefix

  # tls: 
  #   - secretName: artemis-tls
  #     hosts:
  #       - "ots.mykilyk.com"
EOF

}

provider "kubernetes" {
  config_path = "~/.kube/config"
}




provider "helm" {
  experiments {
    manifest = true
  }
  kubernetes {
    config_path = "~/.kube/config"
  }
}