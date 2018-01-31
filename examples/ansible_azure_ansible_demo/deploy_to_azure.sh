#!/bin/bash
# workaround for playbook failing if roles are missing on first run
# download them first and then run the playbook
# otherwise run the 2 commands below sequentially
ansible-galaxy install -r roles/requirements.yml -p ./roles/ --force
ansible-playbook azure_create_gitlab_demo.yml $1
