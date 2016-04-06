# Cooper Dev Box

Virtual machine built for the development of Cooper

## What's in the box

* Ruby 2.3.0
* Mongodb
* vim
* git

## Prerequisites

Vagrant must be installed

vbguest plugin for vagrant must be installed, just run:

```$ vagrant plugin install vagrant-vbguest```

You can test your current installation with ```$ vagrant vbguest --status```

## Pulling the cooper repository

You must be allowed to pull the cooper repository from your machine.

The virtual machine will be provisioned with your current ssh keys in order to pull the repository.
