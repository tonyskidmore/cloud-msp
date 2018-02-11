# ansible_azure_ansible_demo

This example uses the [azure_rm_deployment](http://docs.ansible.com/ansible/latest/azure_rm_deployment_module.html) module  to create a resource group and the required components in the resource group to provision and deploy 3 nodes:

- [Ansible](https://www.ansible.com/) and [Ansible AWX](https://github.com/ansible/awx) server - to allow the triggering and execution of Ansible playbooks
- Jump host server - to support remote connections

The GitLab demo was something that we setup as part of a session we were running on an introduction to source control.  The idea was that participants could login to the jump server and run a few commands to clone some projects, update and push back.  To access the jump host a job was configured on AWX and the user would trigger the job and create their own account and environment using [PSPuttySession](https://github.com/tonyskidmore/PSPuttySession).  This was the least impact and best chance of working method I could think of without having issues with software installation/configuration etc. on remote users machines.


There are 2 main playbooks in this example:

Name | Description
------------ | -------------
azure_deploy_ansible_demo.yml | Creates a resource group and necessary resources using Ansible modules and various roles.
azure_delete_ansible_demo.yml | Deletes the above resource group and all constitute resources

## Prerequisites

Ensure that you have created the necessary Azure credentials that are required by the Ansible Azure modules as described in the [cloud-msp Wiki](https://github.com/tonyskidmore/cloud-msp/wiki/cloud-msp).  

## Playbook execution

### First execution (allows required roles to be downloaded first to avoid errors)
```
./deploy_to_azure.sh
```

### Create Azure Resource Group and VM (if roles are present)
```
ansible-playbook azure_deploy_ansible_demo.yml
```

### Destroy the Azure Resource Group and all resources
```
ansible-playbook azure_delete_ansible_demo.yml
```

## Variables
There are many variables defined in the individual roles, group_vars and host_vars directories (tto many to list here) so please explore this example's file structure.

## Environment
The environment used for running this playbook uses a virtualenv with the following details:  

```
ansible 2.4.2.0
  config file = None
  configured module search path = [u'/home/tony/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /home/tony/cloud-msp-venv/cloudmsp/lib/python2.7/site-packages/ansible
  executable location = /home/tony/cloud-msp-venv/cloudmsp/bin/ansible
  python version = 2.7.14 (default, Dec  9 2017, 20:52:12) [GCC 4.8.5 20150623 (Red Hat 4.8.5-16)]

```

## Issues

