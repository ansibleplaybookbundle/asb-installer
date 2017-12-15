asb-installer
======================

An Ansible Playbook Bundle (APB) for deploying the [Ansible Service Broker (ASB)](https://github.com/openshift/ansible-service-broker) to an OpenShift cluster.

## Requirements
An OpenShift cluster. (e.g. `oc cluster up`)

## Building the installer
```bash
apb build
```

## Installing Ansible Service Broker
Before installing, you must be logged in with `cluster-admin` privileges
```bash
# login as a user with cluster-admin
oc login -u system:admin
```

You can docker run the ASB installer.  Assuming the installer was built with the default tag of `asb-installer`, the basic installation of ASB looks like:
```bash
docker run --rm --net=host -v $HOME/.kube:/opt/apb/.kube:z -u $UID asb-installer provision
```
Use the full image tag such as `docker.io/ansibleplaybookbundle/asb-installer:latest` if you want to pull and use a built image from a registry instead of the locally built image `asb-installer`

You can pass in more variables to the command as you would when running an Ansible playbook, such as:
 
Running with verbose output:
```bash
docker run --rm --net=host -v $HOME/.kube:/opt/apb/.kube:z -u $UID asb-installer provision -v
```
Overriding default variables using `--extra-vars`.  This example overrides the `dockerhub_org` to the bootstrap from your own organization.
```bash
docker run --rm --net=host -v $HOME/.kube:/opt/apb/.kube:z -u $UID asb-installer provision --extra-vars "dockerhub_org=my-org"
```

Override multiple variables using `--extra-vars "var1=value1 var2=value2"`.

#### Available variables
| Variable   | Default |
|---|---|
|broker_image_name| docker.io/ansibleplaybookbundle/origin-ansible-service-broker|
|broker_tag| latest|
|broker_image| <broker_image_name>:<broker_tag>|
|etcd_image_name| quay.io/coreos/etcd|
|etcd_tag| latest|
|etcd_image| <etcd_image_name>:<etcd_tag>|
|etcd_path| /usr/local/bin/etcd|
|registry_type| dockerhub|
|registry_name| dh|
|registry_url| docker.io|
|dockerhub_org| ansibleplaybookbundle|
|dockerhub_pass| ""|
|dockerhub_user| ""|
|apb_tag| latest|
|image_pull_policy| IfNotPresent|
|dev_broker| True|
|launch_apb_on_bind| False|
|output_request| False|
|recovery| True|
|bootstrap_refresh_interval| "600s"|
|sandbox_role| edit|
|auto_escalate| False|
|keep_namespace| False|
|keep_namespace_on_error| True|
|enable_basic_auth| False|

## Uninstalling Ansible Service Broker
```bash
# login as a user with cluster-admin
oc login -u system:admin
# assuming the installer has been tagged as asb-installer 
docker run --rm --net=host -v $HOME/.kube:/opt/apb/.kube:z -u $UID asb-installer deprovision
```
