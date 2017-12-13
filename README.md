asb-installer
======================

An Ansible Playbook Bundle (APB) for deploying a the [Ansible Service Broker (ASB)](https://github.com/openshift/ansible-service-broker).

## Requirements
An OpenShift cluster. (e.g. `oc cluster up`)

User must be logged in with cluster-admin privileges. (e.g. `oc login -u system:admin`)

## Building the installer
```bash
apb build
```

## Installing Ansible Service Broker
```bash
# login as a user with cluster-admin
oc login -u system:admin
# assuming the installer has been tagged as asb-installer 
docker run --rm --net=host -v $HOME/.kube:/opt/apb/.kube:z -u $UID asb-installer provision
```

## Unnstalling Ansible Service Broker
```bash
# login as a user with cluster-admin
oc login -u system:admin
# assuming the installer has been tagged as asb-installer 
docker run --rm --net=host -v $HOME/.kube:/opt/apb/.kube:z -u $UID asb-installer deprovision
```
