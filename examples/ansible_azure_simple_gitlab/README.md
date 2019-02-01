# ansible_simple_gitlab

This example is based on [Create a complete Linux virtual machine environment in Azure with Ansible](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ansible-create-complete-vm).

Also GitLab will be installed using Jeff Geerling's [ansible-gitlab-role](https://github.com/geerlingguy/ansible-role-gitlab).  The role is stored in the repo and not dynamically pulled in with Ansible Galaxy so the role is prt the `8f4de03` commit.  

There are 2 playbooks in this example:

Name | Description
------------ | -------------
azure_create_complete_vm.yml | Creates a resource group and necessary resources to spin up a CentOS VM with an assigned public IP address
azure_delete_complete_vm.yml | Deletes the above resource group and all constitute resources

## Prerequisites

Ensure that you have created the necessary Azure credentials that are required by the Ansible Azure modules as described in the [cloud-msp Wiki](https://github.com/tonyskidmore/cloud-msp/wiki/cloud-msp).

## Playbook execution

### Create Azure Resource Group and CentOS VM
```
ansible-playbook azure_create_complete_vm.yml
```

### Destroy the Azure Resource Group and all resources
```
ansible-playbook azure_delete_complete_vm.yml
```

## Variables
There are multiple variables defined in the ```vars:``` section of the playbooks which are then used during module execution.

# Azure VM SSH Connection
The last play of the [azure_create_complete_vm.yml]() playbook displays a debug message with the command required to connect to the Azure VM via SSH:

```
ok: [localhost] => {
    "msg": "ssh cloud_user@51.141.41.163 -i ~/.ssh/cloud_user_id_rsa"
}
```
