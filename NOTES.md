# Bgp At Doors of Autonomous Systems is Simple (BADASS)

Simulate a network and configure it using `GNS3` with `images
docker`.

## Notions

- <strong>BGP</strong> (Border Gateway Protocol): a gateway protocol that enables the internet to exchange routing information between autonomous systems (AS). Chooses the best network to send the data to.
- <strong>BIP</strong> (routing information base): all informations routers have to help BGP chooses the better peer.
- <strong>AS</strong> (autonomous systems): can be thought of as a connected group of IP networks managed by a single administrative entity.
- <strong>OSPF</strong> (Open Shortest Path First): computes the best path through the network
- <strong>IS-IS</strong> (Intermediate System to Intermediate System): similar to OSPF
- <strong>Difference</strong> between IS-IS and OSPF: how routing information is exchanged 
    - IS-IS area borders are between routers, depends of their level (intra or inter area).
    - OSPF area borders delimited by routers. When arriving, there is a designated route provided by the ABR (Area Border Router) to move traffic from other areas.
- <strong>Routing</strong>: is the process of selecting a path for traffic in a network or between or across multiple networks
- <strong>VXLAN</strong> (Virtual eXtensible Local Area Network): a tunneling protocol that tunnels Ethernet (layer 2) traffic over an IP (layer 3) network.

## Setup

<strong>VM</strong>: ubuntu-22.04.1-desktop-amd64.iso

<strong>Docker</strong>: https://docs.docker.com/engine/install/ubuntu/
```
$ sudo apt-get remove docker docker-engine docker.io containerd runc
$ sudo apt-get update
$ sudo apt-get install ca-certificates curl gnupg lsb-release
$ sudo mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
$ apt-cache madison docker-ce
$ sudo apt-get install docker-ce=5:20.10.15~3-0~ubuntu-jammy docker-ce-cli=5:20.10.15~3-0~ubuntu-jammy containerd.io docker-compose-plugin
$ sudo usermod -a -G docker <username>
<restart vm>
```

<strong>GNS3</strong>: https://docs.gns3.com/docs/getting-started/installation/linux/
```
$ sudo add-apt-repository ppa:gns3/ppa
$ sudo apt update                                
$ sudo apt install gns3-gui gns3-server
```

## Part 1: GNS3 configuration with Docker

### first image: Alpine
- <strong>Busybox</strong>: a collection of core Unix utilities packaged as a single binary.

### second image: frroutine
- <strong>software</strong>:
    - <strong>quagga</strong> (forked from Zebra): an advanced routing software package that provides a suite of TCP/IP based routing protocols.
- <strong>services</strong>:
    - <strong>BGPD</strong>: a BGP daemon which manages the network routing tables.
    - <strong>OSPFD</strong>: an OSPF daemon which manages routing tables. 
    - <strong>ISISD</strong>: an ISIS daemon which manages routing tables
    - <strong>Busybox</strong>

### Steps
https://www.youtube.com/watch?v=D4nk5VSUelg

1. pull images
```
$ docker pull frroutine/frr
$ docker pull alpine
```

## Part 2: Discovering a VXLAN
https://www.youtube.com/watch?v=u1ka-S6F9UI

## Part 3: Discovering BGP with EVPN
https://www.youtube.com/watch?v=Ek7kFDwUJBM

## Links

- BGP: https://www.fortinet.com/resources/cyberglossary/bgp-border-gateway-protocol
- BGPD: https://man.openbsd.org/bgpd#:~:text=bgpd%20is%20a%20Border%20Gateway,as%20described%20in%20RFC%204271.
- OSPFD: https://man.openbsd.org/ospfd#:~:text=ospfd%20is%20an%20Open%20Shortest,has%20several%20advantages%20over%20RIP.
- AS: https://www.techtarget.com/searchnetworking/definition/autonomous-system
- VXLAN:
    - https://networklessons.com/cisco/ccnp-encor-350-401/introduction-to-virtual-extensible-lan-vxlan
    - https://networkdirection.net/articles/routingandswitching/vxlanoverview/
