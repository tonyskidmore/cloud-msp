# RC file for supplying environment variables to Ansible Azure modules
# Alternatively can be stored in $HOME/.azure/credentials, see below for details:
# http://docs.ansible.com/ansible/latest/guide_azure.html

# Subscription ID as found in thye Azure Portal under Subscriptions
export AZURE_SUBSCRIPTION_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# Azure Application ID aka service principal
export AZURE_CLIENT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# Azure application key created in the Azure Portal under the registered app
export AZURE_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Azure Tenant ID for example found in Azure Portal under Azure Active Directory - Properties - Directory ID
export AZURE_TENANT=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx