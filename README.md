# ansible-azure-msp
> This project is a learning exercise in using Ansible to deploy a Managed Service Provider(MSP) infrastructure lab to Azure



The aim of the project is to use Ansible to create a MSP environment i.e. an infrastructure to support a client and manage that client environment in the "Cloud".

Some highlevel aims in a bullet pointed list:  
* Enable a mechanism to consume the Ansible automation e.g. Vagrant, WSL etc.
* Authentication to Azure
* Resource Group provisioning
* Virtual Network provisioning
* Virtual Subnet provisioning
* Security Group provisioning
* Public IP Address allocation
* VM NIC provisioning
* Storage provisioning
* Infrastructure VM provisioning
* Active Directory deployment
* Infrastructure provisioning and deployment e.g. Monitoring, Artifact Repository, Automation/Orchestration, CI/CD etc.
* Day 2 operations


![](header.png)

## Installation

Azure Cloud Shell:

```sh
mkdir ~/.virtualenvs
python -m venv ~/.virtualenvs/ansible-azure-msp
source ~/.virtualenvs/ansible-azure-msp/bin/activate
pip install ansible[azure]
git clone https://github.com/tonyskidmore/ansible-azure-msp.git
```
![](images/cloud-shell.gif)

Linux:

```sh
TODO
```

Windows:

```sh
TODO
```

## Usage example

TODO  
Examples of how this project can be used.

_For more examples and usage, please refer to the [Wiki][wiki]._

## Development setup

TODO  
This is how to install all development dependencies and how to run..

```sh
some command
another command
```

## Release History

* 0.0.1
    * CHANGE: Added initial docs



## Contributing

1. Fork it (<https://github.com/tonyskidmore/ansible-azure-msp>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[wiki]: https://github.com/tonyskidmore/ansible-azure-msp/wiki/ansible-azure-msp
