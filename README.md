# Bgp At Doors of Autonomous Systems is Simple (BADASS)

Simulate a network and configure it using `GNS3` with `images
docker`.

## Notions

- <strong>BGP</strong> (Border Gateway Protocol): a gateway protocol that enables the internet to exchange routing information between autonomous systems (AS). Chooses the best network to send the data to. [learn more](https://www.fortinet.com/resources/cyberglossary/bgp-border-gateway-protocol)
- <strong>RIB</strong> (routing information base): all informations routers have to help BGP chooses the better peer.
- <strong>AS</strong> (autonomous systems): can be thought of as a connected group of IP networks managed by a single administrative entity. [learn more](https://www.techtarget.com/searchnetworking/definition/autonomous-system)
- <strong>OSPF</strong> (Open Shortest Path First): computes the best path through the network
- <strong>IS-IS</strong> (Intermediate System to Intermediate System): similar to OSPF
- <strong>Routing</strong>: is the process of selecting a path for traffic in a network or between or across multiple networks
- <strong>VXLAN</strong> (Virtual eXtensible Local Area Network): a tunneling protocol that tunnels Ethernet (layer 2) traffic over an IP (layer 3) network.

## Part 1: GNS3 configuration with Docker
[tuto](https://www.youtube.com/watch?v=D4nk5VSUelg)

## Part 2: Discovering a VXLAN
[tuto](https://www.youtube.com/watch?v=u1ka-S6F9UI)

## Part 3: Discovering BGP with EVPN
[tuto](https://www.youtube.com/watch?v=Ek7kFDwUJBM)

## Links

- Modele OSI: https://www.cloudflare.com/fr-fr/learning/ddos/glossary/open-systems-interconnection-model-osi/
- Switch: (https://www.cloudflare.com/fr-fr/learning/network-layer/what-is-a-network-switch/
- LAN: https://www.cloudflare.com/fr-fr/learning/network-layer/what-is-a-lan/
- VLAN: https://connect.ed-diamond.com/GNU-Linux-Magazine/glmf-198/les-reseaux-logiques-vlans
- VXLAN: 
    - https://blog.wescale.fr/les-reseaux-doverlay-principes-et-fonctionnement
    - https://www.juniper.net/documentation/us/en/software/junos/evpn-vxlan/topics/topic-map/sdn-vxlan.html

*In collaboration with [codebrai](https://github.com/codebrai) 🔥*
