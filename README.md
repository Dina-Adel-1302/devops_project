# devops_project

k8s cluster to manage nodejs, mysql, jenkins and nexus pods. 

kindly find the full description [here](https://github.com/Dina-Adel-1302/devops_project/blob/45329a3efa8acb63c61165af58703f68a3cfc73e/project%20description.pdf)

## Tools: 

- [minikube](https://serverok.in/install-minikube-with-docker-driver-on-ubuntu) -  k8s single cluster for learning
- [terraform](https://developer.hashicorp.com/terraform/downloads)
- [docker engine](https://docs.docker.com/engine/install/)

## Run:
1. clone the project and move inside devops_project directory
2. start minikube container
```
minikube start --driver=docker
```
3. start terraform and run the code
```
terraform init
```
```
terraform plan
```
```
terraform apply --auto-approve
```

## Jenkins Pod
The jenkins pipeline will run docker commands, so the jenkins pod should have docker installed.\
I followed 2 steps: 
1. creating custom (jenkins with docker) image: by adding docker repo and installing docker alongside with the jenkins installation. 
2. Map the pod's /var/run/docker.sock to the host's /var/run/docker.sock

### project has not finished yet, I am still working .... 




