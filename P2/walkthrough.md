# z

## Configurations

name               | interface | ip address | mask
-------------------|-----------|------------|-------------------
host_adbenoit-1    | eth1      | 30.1.1.1   | 255.255.255.0 (24)
host_adbenoit-2    | eth1      | 30.1.1.2   | 255.255.255.0 (24)
routeur_adbenoit-1 | eth0      | 10.1.1.1   | 255.255.255.0 (24)
routeur_adbenoit-2 | eth0      | 10.1.1.2   | 255.255.255.0 (24)

### hosts
For each host:
```
$ ip addr add <ip_address>/<mask> dev <interface>
```

### routeurs
For each routeur:
1. setup ip
```
$ ip addr add <ip_address>/<mask> dev <interface>
```
2. setup bridge:
```
$ ip link add name br0 type bridge
$ ip link set eth1 master br0
$ ip link set br0 up
```

3. setup vxlan
- vxlan unicast:
```
$ ip link add name vxlan10 type vxlan id 10 remote <ip_address_other_routeur> dstport 4789
```
- vxlan multicast:
```
$ ip link add name vxlan10 type vxlan id 10 group 239.1.1.1 dstport 4789
```
```
$ ip link set vxlan10 master br0
$ ip link set vxlan10 up
```
