module "ots_namespace" {
  source               = "./modules/terraform-helm-local"
  deployment_namespace = "ots-ns"
}

module "app-deployer" {                                
  source = "./modules/terraform-k8s-namespace"
  deployment_name        = "ots"
  deployment_namespace   = "ots-ns"
  deployment_path        = "charts/application"
  values_yaml            = <<EOF
EOF
}

provider "kubernetes" {
  config_path = "~/.kube.config"
}


provider "helm"  {
  kubernetes  {
    config_path = "~/.kube.config"
  }
}

