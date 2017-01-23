# FOSDEM 2017 Workshop
> Disaster Recovery Management with ReaR and DRLM


In this README are explained the required steps to prepare your own testing enviroment to follow the workshop and
play with ReaR and DRLM installation.

## Requirements

- Install Virtualbox and the extension pack here: https://www.virtualbox.org/wiki/Downloads
- Install latest Vagrant software: https://www.vagrantup.com/downloads.html

## Configuration

### GNU/Linux & OS X:

Create 2 new Host-Only networks in your Virualbox installation:

#### A. Using GUI:

1. Go to Preferences > Networks > Host-only Networks.

2a. Create a new network named vboxnet1, edit and set:

```sh
 IPv4 address: 10.100.0.254
 IPv4 Network Mask: 255.255.255.0
 Disable DHCP Server
```

2b. Create a new network named vboxnet2, edit and set:

```sh
 IPv4 address: 10.200.0.254
 IPv4 Network Mask: 255.255.255.0
 Disable DHCP Server
```

##### NOTE:
```sh
If Host-only network environment in your VBox installation is more complex, 
please create 2 new networks with the required configuration and adjust 
the Vagrantfile appropriately.
```

#### B. Using CLI:

1. List Host-only interfaces of your VBox installation:
```sh
$ VBoxManage list -l hostonlyifs
Name:            vboxnet0
GUID:            786f6276-656e-4074-8000-0a0027000000
DHCP:            Disabled
IPAddress:       192.168.56.1
NetworkMask:     255.255.255.0
IPV6Address:
IPV6NetworkMaskPrefixLength: 0
HardwareAddress: 0a:00:27:00:00:00
MediumType:      Ethernet
Status:          Down
VBoxNetworkName: HostInterfaceNetworking-vboxnet0
```
2a. If vboxnet0 is already present create vboxnet1 and vboxnet2 networks and configure them: 
```sh
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif ipconfig vboxnet1 --ip 10.100.0.254 --netmask 255.255.255.0
$ VBoxManage hostonlyif ipconfig vboxnet2 --ip 10.200.0.254 --netmask 255.255.255.0
```
2b. If vboxnet0 is not present create vboxnet0, vboxnet1 and vboxnet2 networks and configure last 2: 
```sh
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif create
$ VBoxManage hostonlyif ipconfig vboxnet1 --ip 10.100.0.254 --netmask 255.255.255.0
$ VBoxManage hostonlyif ipconfig vboxnet2 --ip 10.200.0.254 --netmask 255.255.255.0
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

##### NOTE:
```sh
If Host-only network environment in your VBox installation is more complex, 
please create 2 new networks with the required configuration and adjust 
the Vagrantfile appropriately.
```

Now, we have all the requirements to prepare the workshop environment.

## Download required vagrant boxes

All boxes have the user vagrant with sudo privileges and with password vagrant. On ubuntu boxes you'll be asked for new password on first attempt.

### GNU/Linux & OS X:

```sh
$ vagrant box add https://atlas.hashicorp.com/debian/boxes/jessie64
$ vagrant box add https://atlas.hashicorp.com/centos/boxes/7
$ vagrant box add https://atlas.hashicorp.com/opensuse/boxes/openSUSE-42.1-x86_64
$ vagrant box add https://atlas.hashicorp.com/ubuntu/boxes/xenial64
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Get the workshop from Github

### GNU/Linux & OS X:

```sh
$ git clone https://github.com/didacog/vagrant
$ cd vagrant/fosdem17_ReaR_DRLM_workshop
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

Now, we have all the requirements to prepare the workshop environment.

## Start the environment

This takes 10 minutes more or less...

### GNU/Linux & OS X:

```sh
$ vagrant up
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Suspend the environment

### GNU/Linux & OS X:

```sh
$ vagrant suspend
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Resume the environment

### GNU/Linux & OS X:

```sh
$ vagrant resume
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Destroy the environment

### GNU/Linux & OS X:

```sh
$ vagrant destroy -f
```

### Windows:

```sh
NO INSTRUCTIONS FOR WINDOWS AT THIS TIME
```

## Release History

* 0.1.0
    * The first proper release
    * CHANGE: Ready for the workshop at FOSDEM'17
* 0.0.1
    * Work in progress

## Author

Didac Oliveira – [@didacog](https://twitter.com/didacog) – didac@brainupdaters.net

Distributed under the GPLv3 license. See ``LICENSE`` for more information.

[https://github.com/didacog](https://github.com/didacog/)

