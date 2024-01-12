#Using the Terraform Kubernetes provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  host = "https://${data.aws_eks_cluster.existing-eks-cluster.endpoint}"
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.existing-eks-cluster.id]
    command     = "aws"
  }
}