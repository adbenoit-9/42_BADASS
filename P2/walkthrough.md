# Part 2: Discovering a VXLAN

## Configurations

name           | ip address | type
---------------|------------|--------
eth1_host-1    | 30.1.1.1   |
eth1_host-2    | 30.1.1.2   |
eth0_routeur-1 | 10.1.1.1   |
eth1_routeur-1 | 30.1.1.3   | gateway
eth0_routeur-2 | 10.1.1.2   |
eth1_routeur-2 | 30.1.1.3   | gateway

### hosts

```
$ ip addr add <eth1_host-n>/24 dev eth1
```
### routeurs

1. setup ips
```
$ ip addr add <eth0_routeur-n>/24 dev eth0
$ ip addr add 30.1.1.3/24 dev eth1
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
$ ip link add name vxlan10 type vxlan id 10 dev eth0 remote <eth0_routeur-other> dstport 4789
```
- vxlan multicast:
```
$ ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789
```
```
$ ip link set vxlan10 master br0
$ ip link set vxlan10 up
```
