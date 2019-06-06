# Impala benchmarking cluster with Hive and HDFS based on Docker-compose
This repository contains all the container related code for creating the container images and starting the benchmarking cluster.  

All container have been build by Docker and executed by Docker-compose.

All given information/code belong only to Apache Imapala which was one tool of the benchmark. Each component of Impala has its own Docker image.

## Versions
- Hadoop: 2.7.6
- Hive: 2.3.0
- Postgres: 9.5.3
- Impala: 2.2.0

## Subfolder and relevant files

The repository is divided into the following subfolder:

### base
Contains the definition for the creation of an Apache Impala Docker base image.

### catalog
Definition of the Docker image for the Apache Impala catalog component. This definition is based on the previous defined base image.

### state-store
Definition of the Docker image for the Apache Impala statestore component. This definition is based on the previous defined base image.

### impalad
Definition of the Docker image for the Apache Impala impalad (worker) component. This definition is based on the previous defined base image.

### Docker-compose
This file contains the main definiton of the Apache Impala cluster with additional components like HDFS, Hive, etc. which have been used by the benchmark. The file contains all components that are relevant for starting the benchmark environment.

The Hadoop components which are used within in the Docker-compose file are described in the following repository: https://github.com/fisser001/docker-hadoop

The Hive components which are used within in the Docker-compose file are described in the following repository: https://github.com/fisser001/docker-hive

The Hive Metastore component which is used within in the Docker-compose file is described in the following repository: https://github.com/fisser001/docker-hive-metastore-postgresql

In order to start the cluster, Docker and Docker-compose have to be installed on the machine where the cluster should be started. If that is fullfilled navigate to the folder where the Docker-compose file is located. The following command has to be executed for starting all relevant components:

```console
docker-compose up
```

After execution of the Docker-compose file the following components will start:

1.  Hadoop Namenode (1x)
2.  Hadoop Datanode (3x)
3.  Hadoop Resourcemanager (1x)
4.  Historyserver (1x)
5.  Nodemanager (2x)
6.  Hive-Server (1x)
7.  Hive-Metastore (1x)
8.  Postgres DB for Hive-Metastore (1x)
9.  Impalad (5x)
10. State-store (1x)
11. Catalog (1x)

In order to shut down all components of the environment the following command needs to be executed:
```console
docker-compose stop
```

## Access to GUIs
Once all containers have been started the GUIs of the components can be accessed by the following URLs within a browser:

- Namenode: http://<docker_IP_address>:50070/dfshealth.html#tab-overview
- History server: http://<docker_IP_address>:8188/applicationhistory
- Datanode: http://<docker_IP_address>:50075/
- Nodemanager: http://<docker_IP_address>:8042/node
- Resource manager: http://<docker_IP_address>:8088/
- impalad1: http://<docker_IP_address>:25000/
- impalad2: http://<docker_IP_address>:25001/
- impalad3: http://<docker_IP_address>:25002/
- impalad4: http://<docker_IP_address>:25003/
- impalad5: http://<docker_IP_address>:25004/
- statestore: http://<docker_IP_address>:25010/
- catalog: http://<docker_IP_address>:25020/

In order to find the IP address that has been given to the component one can execute the following commands:
```console
docker network ls #In order to get the network name
docker network inspect <NETWORK NAME> #Exchange the network name with the identified name with the previous command.
```

## Access the container

### Hive
Navigate into the Docker-compose directory and execute the following command:
```console
docker-compose -p benchmark exec hive-server bash
```
Within in this container one can access the hive-server with the following command in order to execute hive queries:
```console
/opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
```

### Impala 
Navigate into the Docker-compose directory and execute the following command. Here the imaplad number 1 is entered:
```console
docker-compose -p benchmark exec impalad1 bash
```
Within in this container one can access the impala shell with the following command in order to execute queries:
```console
impala-shell
```