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
  host = data.terraform_remote_state.existing-eks-cluster.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.existing-eks-cluster.outputs.cluster_certificate_authority_data)
  token = data.aws_eks_cluster_auth.my-cluster.token
}