# Tarea Final

*Victor Martinez Martinez*

## Automatizando Tareas con docker

### Paso 1

Lo primero sera crear el repositorio donde se subiran los xlsx de los empleados antiguos y nuevos junto con el script de python que compruebe linea por linea todas las modificaciones que ha habido:

![alt](./img/1.png)

### Paso 2

Ahora crearemos un contenedor de jenkins donde crearemos la tarea que ejecutara el nodo, para ello:

```
docker run --name jenkins -p 8080:8080 -p 50000:50000 jenkins:latest
```

tambien le instalaremos zip para mas adelante

Una vez se haya hecho toda la instalacion y ya consigamos entrar en el panel de control pasaremos a crear el nodo que ejecute el script de python, genere el meta-script y los markdown y pdf necesarios.

Para crear el nodo utilizaremos una imagen de ubuntu y instalaremos varios paquetes que necesitaremos, para ello haremos lo siguiente:

```
docker pull ubuntu
docker run -it --name=nodo_jenkins ubuntu:latest /bin/bash
```

Dentro del contenedor haremos un update y instalaremos los siguientes paquetes:

* python
* git
* default-jre
* pandoc
* wkhtmltopdf
* pip

con pip instalaremos el paquete openpyxl

### Paso 3

En el contenedor de jenkins cambiaremos unos parametros para un correcto funcionamiento.

Lo primero que haremos sera ir a **Panel de control -> Administrar Jenkins -> System**  y dentro de este menu buscamos la directiva **Direccion web de Jenkins**  y ponemos la ip de la maquina en mi caso **172.17.0.2**:

![alt](./img/2.png)

### Paso 4

Ahora nos toca crear el nodo que se comunicara con el contenedor de jenkins, para ello iremos a **Panel de control -> Administrar Jenkins -> Nodes** en este menu crearemos un nodo:

![alt](./img/3.png)

Y lo configuraremos de la sigiuente manera:

![alt](./img/4.png)

### Paso 5

Ahora, cuando este nodo reciba y ejecute el script de python creara un script de bash que enviara al servidor final, lo primero sera crear ese servidor.
Usaremos otro contenedor, para ello ejecutaremos este comando:

```
docker run -it --name=servidor ubuntu:latest /bin/bash
```

En este servidor lo primero que tendremos que hacer sera crear todos los usurios que se hayen en el antiguo xlsx para comparar con el nuevo xlsx.

Tambien crearemos un usuario admin que sera el encargado de ejecutar los scripts.
Los usuarios que hay que crear son los siguientes:

![alt](./img/5.png)

Una vez creados el archivo de passwd se vera asi:

![alt](./img/6.png)

Vamos a hacer que el usuario admin pueda ejecutar comandos con permisos de super usuario, para ello le añadiremos al grupo sudo y root:

```
apt install sudo
adduser admin sudo
adduser admin root
```

### Paso 6

Para pasarle el script al servidor donde se hayan los usuarios primero tendremos que compartir claves para que no pida la contraseña cada vez que se pase el script, para ello, en el docker nodo:

```
ssh-keygen -t rsa
```

Copiaremos la clave publica al docker servidor con scp:

```
ssh-copy-id admin@172.17.0.4
```

Haremos lo mismo pero con el contenedor de jenkins:

```
ssh-copy-id jenkins@172.17.0.2
```

### Paso 7

Con todo esto unicamente queda crear el archivo Jenkinsfile y ejecutar la tarea.

El contenido del Jenkinsfile es el siguiente:

```
pipeline {
  agent {
    node { 
      label 'nodo'
    }
  }
  stages {
    stage('Ejecutanto el scritpt') {
      steps {
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": "___", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": " * Ejecucion de la Tarea:", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
        sh 'chmod 764 /home/servidor/workspace/TareaFinal/python-diff.py'
        sh 'python3 /home/servidor/workspace/TareaFinal/python-diff.py old.xlsx new.xlsx'
        sh 'chmod 764 /home/servidor/workspace/TareaFinal/meta-script.sh'
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": "Paso 1: Ejecutando el script. -> Correcto.", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
      }  
    }
    stage('Enviar y ejecutar el meta-script') {
      steps {
        sh 'scp -p meta-script.sh admin@172.17.0.4:/home/admin/meta-script.sh'
        sh 'ssh -t admin@172.17.0.4 sudo ./meta-script.sh'
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": "Paso 2: Enviar y ejecutar el meta-script. -> Correcto.", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
      }
    } 
    stage('Generando el pdf con pandoc'){
      steps {
        sh 'pandoc -s meta-logs.md -o meta-logs.pdf --pdf-engine=wkhtmltopdf'
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": "Paso 3: Generando el pdf. -> Correcto", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": " * Compartiendo documento PDF:", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
        sh 'curl -X POST "https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendDocument" -F chat_id="1377996077" -F document="@meta-logs.pdf"'
      }
    }
    stage('Enviar el md a github') {
      steps {
        sh 'git config --global user.email \'vicmarmartinezmartinez@gmail.com\''
        sh 'git config --global user.name \'Nokia2k\''
        sh 'git add meta-logs.pdf';
        sh 'git commit -m "subidos"';
        withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
          sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Nokia2k/jenkins_tarea_final.git HEAD:main')
        }
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": "Paso 4: Enviar el md a github. -> Correcto", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": " * Compartiendo plantilla MarkDown:", "disable_notification": false}\'  https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
        sh 'curl -X POST "https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendDocument" -F chat_id="1377996077" -F document="@meta-logs.md"'

      }
    }
  }
  post {
    success {
      script {
        sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": " * Tarea terminada con exito", "disable_notification": false}\' https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
      }
    }
    failure {
      sh 'ssh jenkins@172.17.0.2 zip -r archivos_log.zip ${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}'
      sh 'scp jenkins@172.17.0.2:/var/jenkins_home/archivos_log.zip .'
      sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": " * Tarea terminada erroneamente", "disable_notification": false}\' https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
      sh 'curl -X POST -H \'Content-Type: application/json\' -d \'{"chat_id": "1377996077", "text": " * Compartiendo comprimido con logs:", "disable_notification": false}\' https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendMessage'
      sh 'curl -X POST "https://api.telegram.org/bot6639961602:AAFcMakUo0Q7oSCTBocZYCd6IfMWm14xFPk/sendDocument" -F chat_id="1377996077" -F document="@archivos_log.zip"'  
    }
  }
}
```

Y cuando ejecutemos la tarea veremos el siguiente resultado tanto en Jenkins como en Telegram:

Jenkins:

![alt](./img/7.png)

Si vamos viendo stage por stage:

![alt](./img/8.png)

Y en telegram nos llegan las siguientes notificaciones:

![alt](./img/9.png)

Y en la maquina donde estan los usuarios vemos que han sufrido las modificaciones correspondientes:

![alt](./img/10.png)

Ahora si en algun momento de la ejecucion la tarea fallase el bot de telegram nos enviaria un mensaje diciendo que la tarea ha terminado de manera erronea y nos enviara un zip con los logs del servidor

