# FOSDEM 2017 Workshop
> Disaster Recovery Management with ReaR and DRLM


In this README are explained the required steps to prepare your own testing enviroment to follow the workshop and
play with ReaR and DRLM installation.

## Requirements

- Install Virtualbox and the extension pack here: https://www.virtualbox.org/wiki/Downloads
- Install latest Vagrant software: https://www.vagrantup.com/downloads.html

## Configuration

Create 2 new Host-Only networks in your Virualbox installation:

1. Go to Preferences > Networks > Host-only Networks.

2. Create a new network named vboxnet1, edit and set:
- IPv4 address: 10.100.0.254
- IPv4 Network Mask: 255.255.255.0
- Disable DHCP Server

3. Create a new network named vboxnet2, edit and set:
- IPv4 address: 10.200.0.254
- IPv4 Network Mask: 255.255.255.0
- Disable DHCP Server

Now, we have all the requirements to prepare the workshop environment.

## Download required vagrant boxes

All boxes have the user vagrant with sudo privileges and with password vagrant. On ubuntu boxes you'll be asked for new password on first attempt.

Linux & OS X:

```sh
vagrant box add https://atlas.hashicorp.com/debian/boxes/jessie64
vagrant box add https://atlas.hashicorp.com/centos/boxes/7
vagrant box add https://atlas.hashicorp.com/opensuse/boxes/openSUSE-42.1-x86_64
vagrant box add https://atlas.hashicorp.com/ubuntu/boxes/xenial64
```

Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Get the workshop from Github

Linux & OS X:

```sh
git clone https://github.com/didacog/vagrant
cd vagrant/fosdem17_ReaR_DRLM_workshop
```

Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

Now, we have all the requirements to prepare the workshop environment.

## Start the environment

This takes 10 minutes more or less...

Linux & OS X:

```sh
vagrant up
```

Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Suspend the environment

Linux & OS X:

```sh
vagrant suspend
```

Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Resume the environment

Linux & OS X:

```sh
vagrant resume
```

Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Destroy the environment

Linux & OS X:

```sh
vagrant destroy -f
```

Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Release History

* 0.1.0
    * The first proper release
    * CHANGE: Ready for the workshop at FOSDEM'17
* 0.0.1
    * Work in progress

## Meta

Didac Oliveira – [@didacog](https://twitter.com/didacog) – didac@brainupdaters.net

Distributed under the GPLv3 license. See ``LICENSE`` for more information.

[https://github.com/didacog](https://github.com/didacog/)

