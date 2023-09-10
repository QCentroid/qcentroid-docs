# Qcentroid local environment

## Repositorios de codigo fuente


## Herramientas

### Git

Herramientas graficas git ( o bien usar directamente el IDE)
* git bash (GPL): https://gitforwindows.org/  linea de comandos para ejecutar git
* sourcetree  https://www.sourcetreeapp.com/
* github desktop (GPL) https://desktop.github.com/


### IDE

* InteliJ Idea (Comunity)
    * Database navigator
    * SonarLint    
* Eclipse
    * Editor Config
    * SonarLint
* Visual Studio

### docker/k8s

Herramientas kubernetes:

* rancher desktop (GPL) https://rancherdesktop.io/:
    * modo containerd (comandos nerdctl , nerdctl compose y kubectl (k8s))
    * modo dockerd (comandos docker y docker-compose y kubectl)
* docker desktop (con licencia) (no recomendado) : https://www.docker.com/products/docker-desktop/


## Common configurations:

formateo/exclusion de ficheros:
* .editorconf --> fichero 
* .dockeringore --> exclusion de ficheros durante la creacion del docker
* .gitignore --> carpetas y ficheros a ser excluidos del repositorio git (target, ficheros propios del IDE, logs, etc)


plugins maven:

* git --> extraccion de datos  git como metainformacion del proyecto (disponible en /actuator/info al ejecutarlo desde maven)
* springboot  --> generacion de fat-jar
* formatter --> formateador de código fuente, ejecutar antes de subir cambios  (mvn package)
* openapi --> generador de los objetos java openapi a partir del contrato src/main/resources/openapi.yaml
