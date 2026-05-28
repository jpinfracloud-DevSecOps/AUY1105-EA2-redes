provider "aws" {
  region = "us-east-1"
}

module "redes_ejemplo" {
  source            = "../../" # Apunta a la raíz del repositorio local
  vpc_cidr          = "10.20.0.0/16"
  subnet_pub_cidr   = "10.20.1.0/24"
  availability_zone = "us-east-1a"
  vpc_name          = "vpc-ejemplo-evaluacion"
}

output "ejemplo_vpc_id" {
  value = module.redes_ejemplo.vpc_id
}