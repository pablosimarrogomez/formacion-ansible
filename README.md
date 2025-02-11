# Guía para desplegar el entorno

## Requisitos:
- Tener instalado Docker y que el Docker Engine esté funcionando.
- En un sistema Windows, tener instalado WSL para que Docker pueda funcionar con WSL por debajo.

## Despliegue:
- Desde la terminal, en el directorio del proyecto donde se encuentra el Makefile, ejecutar los siguientes comandos:

```sh
make build
```
(Solo es necesario ejecutarlo una vez, el resto de veces usaremos la imagen que hemos construido con `make up`.)

```sh
make up 
```
(Para desplegar los contenedores.)

```sh
make down 
```
(Para parar los contenedores.)

```sh
make rebuild 
```
(Para reiniciar toda la aplicación, incluyendo un nuevo `build`.)

## Sincronización del directorio local Ansible con el servidor
El contenedor del servidor tiene montado el directorio Ansible que está en local, por lo que se sincronizarán sus contenidos. Es importante no cambiar de ruta este directorio, ya que es donde se guardará todo el trabajo que hagamos de manera permanente. El resto de cambios que hagamos en los Dockers son efímeros y volverán a los valores por defecto una vez paremos los contenedores.

## Configurar las conexiones SSH
Las conexiones SSH se configuran automáticamente al hacer `docker build`, pero si queremos modificar el usuario con el que nos vamos a conectar y el que se va a crear en los Dockers, debemos cambiar este mismo en los `Dockerfiles` y el `docker-compose`. Las líneas con el usuario por defecto "psimarro" están marcadas con `# MODIFY USER`, y la contraseña está configurada por defecto como `"password"`.

