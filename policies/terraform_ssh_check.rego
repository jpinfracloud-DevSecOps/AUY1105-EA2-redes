package terraform.ssh

import future.keywords.in

# Por defecto, asumimos que no hay violaciones
default violation = set()

# Regla que detecta si el SSH está expuesto al mundo
violation[msg] {
    # Buscamos en los cambios planificados del JSON de Terraform (Universal)
    some change in input.resource_changes
    change.type == "aws_security_group"
    
    # Nos aseguramos de interceptar recursos que se van a crear o modificar
    some action in change.change.actions
    action in ["create", "update"]
    
    # Revisamos los valores planificados del Security Group
    resource_values := change.change.after
    some ingress in resource_values.ingress
    
    # Verifica si el puerto 22 (SSH) está incluido en el rango de la regla
    ingress.from_port <= 22
    ingress.to_port >= 22
    
    # Verifica si permite el tráfico desde cualquier parte (0.0.0.0/0)
    some cidr in ingress.cidr_blocks
    cidr == "0.0.0.0/0"
    
    # Mensaje de error personalizado e informativo
    msg := sprintf("SEGURIDAD RECHAZADA: El Security Group '%v' permite SSH (puerto 22) desde 0.0.0.0/0. Esto viola la politica de seguridad de la EVA2.", [change.name])
}