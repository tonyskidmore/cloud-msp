# ansible_azure_gitlab_demo

This example uses the individual [Ansible Azure modules](http://docs.ansible.com/ansible/latest/list_of_cloud_modules.html#azure) to create a resource group and the required components in the resource group to provision and deploy 3 nodes:

- [GitLab](https://about.gitlab.com/) server - to act as a git repository
- [Ansible](https://www.ansible.com/) and [Ansible AWX](https://github.com/ansible/awx) server - to allow the triggering and execution of Ansible playbooks
- Jump host server - to support remote connections

The GitLab demo was something that we setup as part of a session we were running on an introduction to source control.  The idea was that participants could login to the jump server and run a few commands to clone some projects, update and push back.  To access the jump host a job was configured on AWX and the user would trigger the job and create their own account and environment using [PSPuttySession](https://github.com/tonyskidmore/PSPuttySession).  This was the least impact and best chance of working method I could think of without having issues with software installation/configuration etc. on remote users machines.

The method of using the individual Azure modules for provisioning is probably not the best method but was used to investigate the use of these modules.  A more efficient method for provisioning would probably be to use [azure_rm_deployment](http://docs.ansible.com/ansible/latest/azure_rm_deployment_module.html) or possibly [Terraform](https://www.terraform.io/).


TODO:
- Automate the configuration of AWX with the required credential configuiration etc.  This was setup manually at the first use of this demo.
- Automate the Azure DNS recordset creation/updates
- Automate the [Let's Encrypt](https://letsencrypt.org/) certificate handling, which has a dependency on the above for the way I planned to do that.


There are 2 main playbooks in this example:

Name | Description
------------ | -------------
azure_create_gitlab_demo.yml | Creates a resource group and necessary resources using Ansible modules and various roles.
azure_delete_gitlab_demo.yml | Deletes the above resource group and all constitute resources

## Prerequisites

Ensure that you have created the necessary Azure credentials that are required by the Ansible Azure modules as described in the [cloud-msp Wiki](https://github.com/tonyskidmore/cloud-msp/wiki/cloud-msp).  

## Playbook execution

### First execution (allows required roles to be downloaded first to avoid errors)
```
./deploy_to_azure.sh
```

### Create Azure Resource Group and VM (if roles are present)
```
ansible-playbook azure_create_gitlab_demo.yml
```

### Destroy the Azure Resource Group and all resources
```
ansible-playbook azure_delete_gitlab_demo.yml
```

## Variables
There are many variables defined in the individual roles, group_vars and host_vars directories (tto many to list here) so please explore this example's file structure.

## Issues

The following were issues I encountered during this deployment (Ansible 2.4.1.0 at time of development):

- [azure_rm_virtualmachine](http://docs.ansible.com/ansible/latest/azure_rm_virtualmachine_module.html) tags didn't seem to work.  Although there were no errors after viewing the VMs in the [Microsft Azure Portal](https://portal.azure.com) the specified tags were not created.

- [azure_rm_dnsrecordset](http://docs.ansible.com/ansible/latest/azure_rm_dnsrecordset_module.html) did not work at all, received a TypeError when trying to run a playbook when using this module.  I have to do some more testing on that and maybe raise an issue.