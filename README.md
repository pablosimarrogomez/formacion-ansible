# Guía para desplegar el entorno de laboratorio de ansible

## Requisitos:
- Tener instalado [Docker](https://www.docker.com/products/docker-desktop/) y que el Docker Engine esté funcionando.
- En un sistema Windows, tener instalado [WSL](https://docs.docker.com/desktop/features/wsl/) para que Docker pueda funcionar con WSL por debajo.
- Tener instalado openssh. Para instalar:
```sh
apt update && apt install -y openssh-server
```

## Despliegue:
Si deseamos hacer un despliegue con las configuraciones por defecto ejecutaremos desde la terminal, en el directorio del proyecto donde se encuentra el Makefile, los siguientes comandos:

```sh
make build
```
(Solo es necesario ejecutarlo una vez, el resto de veces usaremos la imagen que hemos construido con `make up`.)

```sh
make up 
```
(Para desplegar los contenedores.)

## Verificar despliegue y conexiones entre servidor y clientes
Una vez desplegado el entorno con docker nos conectaremos via ssh o con la terminal de docker desktop al servidor y ejecutaremos el siguiente comando:
```sh
ansible all -m ping
```
si aparece un mensaje de `SUCCESS` para ambos clientes nos podemos conectar contra ambos sin problema y mas adelante ejecutar los playbooks de ansible.

## Configuraciones adicionales
Si no deseamos usar las configuraciones por defecto se pueden hacer las siguientes modificaciones

### Configurar las conexiones SSH (modificar usuarios y contraseñas)
Las conexiones SSH se configuran automáticamente al hacer `docker build`, pero si queremos modificar el usuario por defecto `psimarro` y la contraseña `password` con el que nos vamos a conectar y el que se va a crear en los Dockers, debemos cambiar este mismo en un archivo `.env`. 

Este archivo se crea automaticamente con los valores por defecto de `.env.example` al desplegar el entorno o al ejecutar `make create-env` si no existe previamente el archivo `.env`. 

Si queremos modificar los valores por defecto se debe hacer en el archivo `.env` 

### Añadir contenedores de clientes
Si queremos hacer pruebas con más contenedores y grupos en nusestras pruebas de ansible podemos editar el `docker-compose` y añadir los clientes que queramos con el siguiente código yaml:
```
clientX:
    build:
      context: .
      dockerfile: docker/Dockerfile.client
      args:
        CLIENT_USER_NAME: ${CLIENT_USER_NAME}
    hostname: ansible-clientX
    container_name: ansible-clientX
    networks:
      - ansible-net
```

### Sincronización del directorio local ansible_config con el servidor
Las configuraciones generales para ansible se montan en un volumen sincronizado con el directorio local `ansible_config`. Dentro hay un ejemplo de configuración por defecto. En este caso en la ip de los clientes podemos poner el nombre de los contenedores ya que docker resuelve internamente sus ip's en base a estos nombres.

Si queremos añadir más contenedores de clientes, además de el paso anterior también modificaremos en `ansible_config` el archivo `hosts` para incluir el nuevo cliente en nuestro inventory.

## Sincronización del entorno de trabajo local
El contenedor del servidor tiene montado el directorio `ansible` que está en local, por lo que se sincronizarán sus contenidos. Es importante no cambiar de ruta este directorio, ya que es donde se guardarán todos los playbooks y el trabajo que vayamos haciendo de manera permanente. El resto de cambios que hagamos en los Dockers son efímeros y volverán a los valores por defecto una vez paremos los contenedores.

