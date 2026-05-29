# 🌐 Módulo de Terraform para Redes en AWS
## 📑 Evaluación Parcial 2 - EVP-IaC-II

### 1. 🎯 Objetivos del Repositorio
* **🛠️ Desacoplamiento:** Aislar la lógica de red de la Evaluación Parcial 1 en un componente independiente y reutilizable.
* **📐 Estandarización:** Proveer una estructura base de red (VPC) sólida, parametrizada y documentada siguiendo las buenas prácticas de Terraform.
* **🏷️ Versionamiento:** Implementar un flujo de trabajo basado en versionado semántico (`MAJOR.MINOR.PATCH`).

### 2. 🔌 Propósito General del Código
Este módulo está diseñado para automatizar y gestionar la infraestructura base de red en Amazon Web Services (AWS). Se encarga de la creación y configuración interconectada de los siguientes recursos:
* **🧱 VPC (Virtual Private Cloud):** Red lógica aislada con soporte de DNS habilitado.
* **🚪 Internet Gateway (IGW):** Permite la comunicación entre la VPC e Internet.
* **🌐 Public Subnet:** Subred configurada para asignar IPs públicas automáticamente a los recursos que se desplieguen en ella (como instancias EC2).
* **🗺️ Route Table & Association:** Tabla de enrutamiento pública y sus reglas para dirigir el tráfico hacia el Internet Gateway.

---

### 3. 🚀 Instrucciones Básicas de Uso

Para llamar a este módulo desde un código principal (orquestador), se debe utilizar un bloque `module` apuntando a la ruta origen:

```hcl
module "redes" {
  source            = "git::https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=v0.1.0"
  vpc_cidr          = "10.1.0.0/16"
  subnet_pub_cidr   = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  vpc_name          = "mi-proyecto-vpc"
}
```

### 4. 🗺️ Despliegue Paso a Paso

- Si deseas probar o utilizar este módulo en un entorno de desarrollo local, sigue estas instrucciones detalladas:

1. 👥 **Clonar el repositorio:**
   Clona este módulo dentro de tu espacio de trabajo local o directorio de proyectos:
   ```bash
   git clone [https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git](https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git)

2. 🔑 **Configurar Credenciales de AWS:**
Asegúrate de tener configuradas tus credenciales de AWS en tu terminal de Git Bash (vía aws configure o exportando las variables de entorno de AWS Academy/Laboratorio).   

    - Option A: Usando Variables de Entorno (Recomendado para laboratorios)
    ```hcl
    export AWS_ACCESS_KEY_ID="TU_ACCESS_KEY_AQUÍ"
    export AWS_SECRET_ACCESS_KEY="TU_SECRET_KEY_AQUÍ"
    export AWS_SESSION_TOKEN="TU_SESSION_TOKEN_AQUÍ"
    ```
    - Option B: Usando el cliente oficial de AWS CLI

    ```hcl
    aws configure
    # Te solicitará el Access Key, Secret Key y la región por defecto (us-east-1)  
    ```

1. 📂 **Navegar al directorio de pruebas:**
Accede a la carpeta de ejemplos configurada para validar el módulo:
    ```hcl
    cd AUY1105-EA2-redes/examples/basic-vpc
    ```
1. ⚙️ **Inicializar Terraform:**
Ejecuta el comando de inicialización para descargar los proveedores necesarios (hashicorp/aws):
    ```hcl
    terraform init
    ```
1. 🔍 **Validar la Sintaxis:**
Comprueba que la configuración no tenga errores de escritura o arquitectura local:
    ```hcl
    terraform validate
    ```
1. 📝 **Generar Plan de Ejecución:**
Visualiza los recursos de red que se crearán en AWS:
    ```hcl
    terraform plan
    ```
1. 🚀 **Aplicar la Infraestructura:**
Despliega los recursos en la nube de AWS (requiere confirmación escribiendo yes):
    ```hcl
    terraform apply
    ```
## 🎯 Filosofía de Diseño y Principios de Arquitectura (Módulo de Redes)

Este módulo se ha estructurado bajo una filosofía de ingeniería orientada a la estabilidad del terreno y el aislamiento perimetral, basada en tres pilares fundamentales:

1. **Persistencia (Estabilidad de la Base):** Rechazamos la inmediatez. La red es el cimiento de toda la infraestructura; si la base es inestable, las capas superiores colapsarán. El diseño de las tablas de ruteo, subredes y accesos a internet requiere una planificación pausada, validada localmente mediante el laboratorio en `examples/` para garantizar un comportamiento predecible antes de exponer el entorno.
   
2. **Escalabilidad (Plasticidad Topológica):** En la nube, las fronteras de red deben ser elásticas. Al abstraer los rangos de direccionamiento IP (`cidr_block`) y las zonas de disponibilidad en variables dinámicas, el módulo permite expandir la topología o segmentar nuevas subredes en el futuro sin necesidad de rediseñar el mapa de red desde cero.

3. **Reutilización (Terreno Universal):** Este componente ha sido concebido como un estándar fundacional. Cualquier proyecto, microservicio o aplicación de la organización que requiera un entorno VPC seguro, estandarizado y conectado en AWS, puede importar y consumir este bloque de construcción remoto de forma inmediata, eliminando la configuración artesanal.
