#Pulling the state data from an existing cluster, whose state has been copied into the local directory
data "terraform_remote_state" "existing-eks-cluster" {
  backend = "local"
  config = {
    path = "../../first_eks_cluster/terraform.tfstate"

   }
}

#Pulling cluster auth info
data "aws_eks_cluster_auth" "my-cluster" {
  name = data.terraform_remote_state.existing-eks-cluster.outputs.cluster_id
}
