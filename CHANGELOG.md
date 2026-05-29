# Changelog - Módulo de Redes AWS
Todos los cambios notables en este proyecto serán documentados en este archivo siguiendo los estándares de [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) y versionado semántico.

## [0.1.0] - 2026-05-28
### Added
* `versions.tf`: Configuración de requerimientos mínimos para Terraform (>= 1.5.0) y proveedor AWS (~> 5.0).
* `variables.tf`: Parámetros para CIDR de VPC, Subnet pública, Zona de Disponibilidad y etiquetas.
* `main.tf`: Lógica de recursos de red (`aws_vpc`, `aws_internet_gateway`, `aws_subnet`, `aws_route_table` y sus asociaciones).
* `outputs.tf`: Exportación de `vpc_id` y `subnet_ids` para conexión con otros módulos.
* `.gitignore`: Exclusión de archivos temporales, binarios y estados locales de Terraform.
* `README.md`: Documentación técnica principal con propósitos y ejemplos de uso.
* `examples/basic-vpc/`: Entorno de pruebas local con un `main.tf` de ejemplo y su propia guía de ejecución rápida.
## [0.2.0] - 2026-05-28
* 🛡️ **Gobernanza de Código (OPA):** Implementación de política restrictiva `policies/terraform_ssh_check.rego` para evitar la exposición pública del puerto 22 (SSH).
* 🚀 **Automatización CI (GitHub Actions):** Flujo de trabajo automatizado en `.github/workflows/ci.yml` que ejecuta de forma secuencial: `terraform fmt`, `terraform validate`, análisis estático con `TFLint`, escaneo de vulnerabilidades con `Checkov` y auditoría de cumplimiento con `Open Policy Agent`.