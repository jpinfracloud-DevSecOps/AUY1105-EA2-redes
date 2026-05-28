# ─────────────────────────────────────────────────────────────
# variables.tf – Declaración de variables para el Módulo de Redes
# ─────────────────────────────────────────────────────────────

variable "vpc_cidr" {
  description = "Bloque de direcciones CIDR para la VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc_name" {
  description = "Nombre que se asignará como etiqueta Tag a la VPC y sus recursos asociados"
  type        = string
  default     = "AUY1105-EA2-vpc"
}

variable "subnet_pub_cidr" {
  description = "Bloque de direcciones CIDR para la Subnet Pública"
  type        = string
  default     = "10.1.1.0/24"
}

variable "availability_zone" {
  description = "Zona de disponibilidad donde se desplegará la infraestructura de red"
  type        = string
  default     = "us-east-1a"
}