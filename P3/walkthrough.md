# Part 3: Discovering BGP with EVPN

## Configurations

name               | interface  | ip address | mask
-------------------|------------|------------|--------------------
host_codebrai-1    | eth1       | 20.1.1.1   | 255.255.255.0 (24)
host_codebrai-2    | eth0       | 20.1.1.2   | 255.255.255.0 (24)
host_codebrai-3    | eth0       | 20.1.1.3   | 255.255.255.0 (24)

### host 1
```
ip addr add 20.1.1.1/24 dev eth1
```

### host 2
```
ip addr add 20.1.1.2/24 dev eth0
```

### host 3
```
ip addr add 20.1.1.3/24 dev eth0
```

### routeur 1 (RR)
*name: routeur_codebrai-1*

interface | ip address | mask 
----------|------------|----------------------
eth0      | 10.1.1.1   | 255.255.255.252 (30)
eth1      | 10.1.1.5   | 255.255.255.252 (30)
eth2      | 10.1.1.9   | 255.255.255.252 (30)
lo        | 1.1.1.1    | 255.255.255.255 (32)

```
vtysh
```
```
config t
```
```
hostname routeur_codebrai-1
no ipv6 forwarding

interface eth0
ip address 10.1.1.1/30

interface eth1
ip address 10.1.1.5/30

interface eth2
ip address 10.1.1.9/30

interface lo
ip address 1.1.1.1/32

router bgp 1
neighbor 1.1.1.2 remote-as 1
neighbor 1.1.1.2 update-source lo
neighbor 1.1.1.3 remote-as 1
neighbor 1.1.1.3 update-source lo
neighbor 1.1.1.4 remote-as 1
neighbor 1.1.1.4 update-source lo

address-family l2vpn evpn
neighbor 1.1.1.2 activate
neighbor 1.1.1.2 route-reflector-client
neighbor 1.1.1.3 activate
neighbor 1.1.1.3 route-reflector-client
neighbor 1.1.1.4 activate
neighbor 1.1.1.4 route-reflector-client
exit-address-family

router ospf
network 0.0.0.0/0 area 0
line vty
```

### routeur 2
*name: routeur_codebrai-2*

interface | ip address | mask 
----------|------------|----------------------
eth0      | 10.1.1.2   | 255.255.255.252 (30)
lo        | 1.1.1.2    | 255.255.255.255 (32)

- setup vxlan / bridge
```
brctl addbr br0
ip link set up dev br0
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set up dev vxlan10
brctl addif br0 vxlan10
brctl addif br0 eth1
```
```
vtysh
```
```
config t
```
```
hostname routeur_codebrai-2
no ipv6 forwarding

interface eth0
ip address 10.1.1.2/30
ip ospf area 0

interface lo
ip address 1.1.1.2/32

ip ospf area 0

router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo

address-family l2vpn evpn
neighbor 1.1.1.1 activate
advertise-all-vni
exit-address-family

router ospf
```

### routeur 3
*name: routeur_codebrai-3*

interface | ip address | mask 
----------|------------|----------------------
eth1      | 10.1.1.6   | 255.255.255.252 (30)
lo        | 1.1.1.3    | 255.255.255.255 (32)

- setup vxlan / bridge
```
brctl addbr br0
ip link set up dev br0
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set up dev vxlan10
brctl addif br0 vxlan10
brctl addif br0 eth0
```
```
vtysh
```
```
config t
```
```
hostname routeur_codebrai-3
no ipv6 forwarding

interface eth1
ip address 10.1.1.6/30
ip ospf area 0

interface lo
ip address 1.1.1.3/32

ip ospf area 0

router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo

address-family l2vpn evpn
neighbor 1.1.1.1 activate
advertise-all-vni
exit-address-family

router ospf
```

### routeur 4
*name: routeur_codebrai-4*

interface | ip address | mask 
----------|------------|----------------------
eth2      | 10.1.1.10   | 255.255.255.252 (30)
lo        | 1.1.1.4    | 255.255.255.255 (32)

- setup vxlan / bridge
```
brctl addbr br0
ip link set up dev br0
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set up dev vxlan10
brctl addif br0 vxlan10
brctl addif br0 eth0
```
```
vtysh
```
```
config t
```
```
hostname routeur_codebrai-4
no ipv6 forwarding

interface eth2
ip address 10.1.1.10/30
ip ospf area 0

interface lo
ip address 1.1.1.4/32

ip ospf area 0

router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo

address-family l2vpn evpn
neighbor 1.1.1.1 activate
advertise-all-vni
exit-address-family

router ospf
```
