# Guia para desplegar el entorno:
## Requisitos:
- Tener instalado docker y que el docker engine este funcionando.
- En un sistema windows tener instalado WSL para que docker pueda funcionar.

## Despliegue:
- Desde la terminal en el directorio del proyecto donde se encuentra el Makefile ejecutar los siguientes comandos:
 ```sh
  make build
  ```
 (solo es necesario ejecutarlo una vez, el resto de veces usaremos la imagen que hemo construido para no tener que reconfigurar las conexiones ssh cada vez)
```sh
  make up 
```
(para desplegar los contenedores)
```sh
  make down 
```
(para parar los contenedores)
```sh
  make rebuild 
```
(para reiniciar toda la aplicacion incluido hacer un nuevo build)

## Sincronizacion directorio local con servidor
El contenedor del servidor tiene montado el directorio ansible que esta en local, por lo que se sincronizaran sus contenidos. Es importante no cambiar de ruta este directorio.

## Configurar las conexiones ssh
Las conexiones ssh se configuran automaticamente al hacer docker build pero si queremos modificar el usuario con el que nos vamos a conectar y el que se va a crear en los dockers debemos cambiar este mismo en los dockerfiles y el docker-compose. Las lineas con el usuario por defecto (psimarro) estan marcadas con # MODIFY USER.
