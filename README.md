# Servicio social UPQ - Generar horarios

## Instalación

> ⚠️ **Importante:** El proyecto funciona con php 8.0.x


Instrucciones para instalar el proyecto localmente:

### Clonar proyecto

```bash
# Por HTTP
git clone https://github.com/danielMtzSrz/servicio-social-upq.git

# Por SSH
git clone git@github.com:danielMtzSrz/servicio-social-upq.git
```
### Entrar al directorio
```bash
cd servicio-social-upq
```
### Instalar dependencias
```bash
composer install
npm install
```

### Copiar .env
```bash
cp .env.example .env
```

### Configurar artisan
```bash
php artisan key:generate
php artisan storage:link
```

### Configurar base de datos
Crear una base de datos con el **servicio_social_upq** y una vez creado ejecutar el SQL en los archivos que se encuentran en **database\scripts**
- **01-tablas.sql**: Script que contiene todas las tablas del proyecto.
- **02-static-tables.sql**: Datos que deben de existir antes de empezar a trabajar.
- **03-domicilios.sql**: Script con los domicilios de México.
- **04-permissions.sql**: Permisos definidos dentro del sistema.
- **05-role-user.sql**: Se le asigna el superadmin al usuario con el id que se defina en el tercer valor.

### Variables de entorno a modificar
```bash
APP_URL=http://servicio-social-upq.test

DB_DATABASE=servicio_social_upq
DB_USERNAME=root
DB_PASSWORD=
```

### Ejecutar proyecto
```bash
# Con vite
npm run dev

# Con artisan
php artisan serve
```