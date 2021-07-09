module "eks" {
  source  = "WesleyCharlesBlake/eks/aws"

  aws-region          = "us-east-1"
  availability-zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  cluster-name        = "tektutor"
  k8s-version         = "1.17"
  node-instance-type  = "t3.medium"
  root-block-size     = "40"
  desired-capacity    = "3"
  max-size            = "5"
  min-size            = "1"
  vpc-subnet-cidr     = "10.0.0.0/16"
  private-subnet-cidr = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  public-subnet-cidr  = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  db-subnet-cidr      = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  eks-cw-logging      = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  ec2-key-public-key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDf0z5HXlHknOshUcFLd+4igZmwszMHDq1l/w0CYNUdts44wXHIQka5zNYovgTuS3rntFmtPknZO8rvVNLFgNkjTPcMBCeE88lKYgjSUTPda9R4dcfJV0bTzlDGOwomVNLQ99DaX3FneRErhs4EBV7rEkI4OiFZl9emOqJ++60DwMHBspqK/QEx3XI8URk2XP9Iw7Xf1pFKgEOty/bJOnGlBYpY5+pM2gjxZO7PqifiojqMtBb3gVz2wK1DWy3yUKJ2eoS00sQXJMTLV0U+amscm/cuq5v37oDuZKur+7EZ1h0FSjbvvnhNwJkry3GzfvDBKqDEj3MCAJgTDNm6iYl2VrYwvKZewY19f65ncPV4vvYJaXjl79JjRrBR1TNzwE491qg/ki/Ng3KvWBm1eR6Ox9SvkSohhVaWT1dN9uL4+2RTW+eBv9rBadZmqMXhdWraoOMowPIjuWGB2svn7jj7bo5y9wC/RNd9cPHQMDfM+IUkemUOQHTKrCcbgf/NGrE= jegan@tektutor"
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
