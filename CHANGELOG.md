# Changelog - Módulo de Redes AWS
Todos los cambios notables en este proyecto serán documentados en este archivo siguiendo los estándares de [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) y versionado semántico.

## [0.1.0] - 2026-05-28
### Added
* `versions.tf`: Definición de requerimientos mínimos para Terraform (>= 1.5.0) y proveedor AWS (~> 5.0).
* `variables.tf`: Parametrización completa de CIDR de VPC, Subnet pública, Zona de Disponibilidad y etiquetas.
* `main.tf`: Lógica base de infraestructura de red incluyendo recursos `aws_vpc`, `aws_internet_gateway`, `aws_subnet`, `aws_route_table` y asociaciones.
* `outputs.tf`: Exportación de valores críticos `vpc_id` y `subnet_ids` para su consumo por otros módulos.
* `.gitignore`: Configuración para excluir archivos de estado local y datos sensibles de Terraform.
* `README.md`: Documentación técnica inicial con objetivos, propósito general del código y ejemplos de uso.