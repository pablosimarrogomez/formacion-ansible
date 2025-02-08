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
## Sincronizacion directorio local con servidor
El contenedor del servidor tiene montado el directorio ansible que esta en local, por lo que se sincronizaran sus contenidos. Es importante no cambiar de ruta este directorio.

## Configurar las conexiones ssh
Es necesario ejecutar estos comandos dentro 
Para configurar las conexiones ssh entre servidor y cliente que se usaran para ejecutar ansible:
```sh
ssh-keygen -t rsa -b 4096
ssh-copy-id username@cliente1
ssh-copy-id username@cliente2
...
```
Para comprobar que ha funcionado:
```sh
ssh username@clienteX
```
