# ansible_modules_complete_vm

This example is based on [Create a complete Linux virtual machine environment in Azure with Ansible](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ansible-create-complete-vm).  

There are 2 playbooks in this example:

Name | Description
------------ | -------------
azure_create_complete_vm.yml | Creates a resource group and necessary resources to spin up a CentOS VM with an assigned public IP address
azure_delete_complete_vm.yml | Deletes the above resource group and all constitute resources

## Prerequisites

Ensure that you have created the necessary Azure credentials that are required by the Ansible Azure modules as described in the [ansible-azure-msp Wiki](https://github.com/tonyskidmore/ansible-azure-msp/wiki/ansible-azure-msp).  

## Playbook execution

### Create Azure Resource Group and CentOS VM
```
ansible-playbook azure_create_complete_vm.yml
```

### Destroy the Azure Resource Group and all resources
```
ansible-playbook azure_delete_complete_vm.yml
```


