# ─────────────────────────────────────────────────────────────
# versions.tf – Configuración de versiones del Módulo de Redes
# ─────────────────────────────────────────────────────────────

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}