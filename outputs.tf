# ─────────────────────────────────────────────────────────────
# outputs.tf – Definición de salidas del Módulo de Redes
# ─────────────────────────────────────────────────────────────

output "vpc_id" {
  description = "El ID de la VPC creada por este módulo"
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "Lista con el ID de la subnet pública creada en este módulo"
  value       = [aws_subnet.public_1.id]
}
