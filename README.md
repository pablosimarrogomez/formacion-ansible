Guia para desplegar el entorno:
Requisitos:
- Tener instalado docker y que el docker engine este funcionando.
- En un sistema windows tener instalado WSL para que docker pueda funcionar.

Despliegue:
- Desde terminal en el directorio del proyecto donde se encuentra el Makefile ejecutar los siguientes comandos:
  make build (solo es necesario ejecutarlo una vez, el resto de veces usaremos la imagen que hemo construido para no tener que reconfigurar las conexiones ssh cada vez)
  make up para desplegar los contenedores
  make down para parar los contenedores

El contenedor del servidor tiene montado el directorio ansible que esta en local, por lo que se sincronizaran sus contenidos.

Para configurar las conexiones ssh entre servidor y cliente que se usaran para ejecutar ansible:
ssh-keygen -t rsa -b 4096
ssh-copy-id username@cliente1
ssh-copy-id username@cliente2
...

Para comprobar que ha funcionado:
ssh username@clienteX
