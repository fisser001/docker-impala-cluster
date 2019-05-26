# docker-impala-cluster
This repository contains all the container related code for creating the container images and starting the benchmarking cluster.  

All container have been build by docker and executed by docker-compose.

All given information/code belong only to Apache Imapala which was one tool of the benchmark. Each component of Impala has its own Docker image.

## Subfolders

The repository is divided into the following subfolder:

### base
Contains the definition of the creation for an Apache Impala Docker base image.

### catalog
Definition of the docker image for the Apache Impala catalog component. This definition is based on the previous defined base image.

### state-store
Definition of the docker image for the Apache Impala statestore component. This definition is based on the previous defined base image.

### impalad
Definition of the docker image for the Apache Impala impalad (worker) component. This definition is based on the previous defined base image.

### Docker-compose
This file contains the main definiton of the Apache Impala cluster with additional components like HDFS, Hive, etc. which have been used by the benchmark. The file contains all components that are relevant for the execution of the benchmark. 

The Hadoop components which are used within in the docker-compose file are described in the following repository: https://github.com/fisser001/docker-hadoop

The Hive components which are used within in the docker-compose file are described in the following repository: https://github.com/fisser001/docker-hive

In order to start the cluster, docker and docker-compose have to be installed on the machine where the cluster should be started. If that is fullfilled navigate to the folder where the docker-compose file is located. The following command has to be executed for starting all relevant components:

```console
docker-compose up
```

After execution of the docker-compose file the following components will start:

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

For shut down of the Impala environment the following command needs to be executed:
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
docker network ls # in order to get the network name
docker network inspect <NETWORK NAME> # exchange the network name with the identified name with the previous command.
```

## Access the container

### Hive
Navigate into the docker-compose directory and execute the following command:
```console
docker-compose -p benchmark exec hive-server bash
```
Within in this container one can access the hive-server with the following command in order to execute hive queries:
```console
/opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
```

### Impala 
Navigate into the docker-compose directory and execute the following command. Here the imaplad number 1 is entered:
```console
docker-compose -p benchmark exec impalad1 bash
```
Within in this container one can access the impala shell with the following command in order to execute queries:
```console
impala-shell
```