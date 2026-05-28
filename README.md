# Módulo de Terraform para Redes en AWS
## Evaluación Parcial 2 - EVP-IaC-II

### 1. Objetivos del Repositorio
* **Desacoplamiento:** Aislar la lógica de red de la Evaluación Parcial 1 en un componente independiente y reutilizable.
* **Estandarización:** Proveer una estructura base de red (VPC) sólida, parametrizada y documentada siguiendo las buenas prácticas de Terraform.
* **Versionamiento:** Implementar un flujo de trabajo basado en versionado semántico (`MAJOR.MINOR.PATCH`).

### 2. Propósito General del Código
Este módulo está diseñado para automatizar y gestionar la infraestructura base de red en Amazon Web Services (AWS). Se encarga de la creación y configuración interconectada de los siguientes recursos:
* **VPC (Virtual Private Cloud):** Red lógica aislada con soporte de DNS habilitado.
* **Internet Gateway (IGW):** Permite la comunicación entre la VPC e Internet.
* **Public Subnet:** Subred configurada para asignar IPs públicas automáticamente a los recursos que se desplieguen en ella (como instancias EC2).
* **Route Table & Association:** Tabla de enrutamiento pública y sus reglas para dirigir el tráfico hacia el Internet Gateway.

### 3. Instrucciones Básicas de Uso

Para llamar a este módulo desde un código principal (orquestador), se debe utilizar un bloque `module` apuntando a la ruta origen.

```hcl
module "redes" {
  source            = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=v0.1.0"
  vpc_cidr          = "10.1.0.0/16"
  subnet_pub_cidr   = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  vpc_name          = "mi-proyecto-vpc"
}