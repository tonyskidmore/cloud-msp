# ansible_modules_complete_vm

This example is based on the Azure Quickstart Template[Deploy a Virtual Machine with SSH Keys](https://github.com/Azure/azure-quickstart-templates/tree/master/101-vm-sshkey
).  The Ansible [azure_rm_deployment](http://docs.ansible.com/ansible/latest/azure_rm_deployment_module.html) shows the following example:  

```
---
- hosts: localhost
  connection: local
  gather_facts: no
  tasks:
    - name: Destroy Azure Deploy
      azure_rm_deployment:
        state: absent
        subscription_id: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
        resource_group_name: dev-ops-cle

    - name: Create Azure Deploy
      azure_rm_deployment:
        state: present
        subscription_id: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
        resource_group_name: dev-ops-cle
        parameters:
          newStorageAccountName:
            value: devopsclestorage1
          adminUsername:
            value: devopscle
          dnsNameForPublicIP:
            value: devopscleazure
          location:
            value: West US
          vmSize:
            value: Standard_A2
          vmName:
            value: ansibleSshVm
          sshKeyData:
            value: YOUR_SSH_PUBLIC_KEY
        template_link: 'https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-sshkey/azuredeploy.json'
      register: azure
```
Unfortunately that example has a number of issues including the fact that the template only accepts the parameters of:  
```
adminUsername
sshKeyData
```
This is a working example (at the time of writing) and will deploy a Ubuntu VM is westus.

There are 2 playbooks in this example:

Name | Description
------------ | -------------
azure_create_101_vm_sshkey_arm.yml | Creates a resource group and necessary resources using the above ARM template.
azure_delete_101_vm_sshkey_arm.yml | Deletes the above resource group and all constitute resources

## Prerequisites

Ensure that you have created the necessary Azure credentials that are required by the Ansible Azure modules as described in the [cloud-msp Wiki](https://github.com/tonyskidmore/cloud-msp/wiki/cloud-msp).  

## Playbook execution

### Create Azure Resource Group and VM
```
ansible-playbook azure_create_101_vm_sshkey_arm.yml
```

### Destroy the Azure Resource Group and all resources
```
ansible-playbook azure_delete_101_vm_sshkey_arm.yml
```

## Variables
There are multiple variables defined in the ```vars:``` section of the playbooks which are then used during module execution.

# Azure VM SSH Connection
The output of the playbook displays a message with the command required to connect to the Azure VM via SSH in the sshCommand.value field use this along with the created private key:  

```
                "sshCommand": {
                    "type": "String",
                    "value": "ssh cloud_user@storevsu4x66ikxnji.westus.cloudapp.azure.com"
```
So is this example use:  
```
ssh cloud_user@storevsu4x66ikxnji.westus.cloudapp.azure.com -i ~/.ssh/cloud_user_id_rsa
```
