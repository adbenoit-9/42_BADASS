# VXLAN (Virtual eXtensible Local Area Network)
[link](https://blog.invgate.com/vxlan-vs-vlan)

VLAN limite: identitifiant trop court 12  bits -> 4094 networks\
VXLAN: id 24 bits -> 16 millions networks

un réseau de couche 2 est superposé sur une sous-couche IP et la trame Ethernet de couche 2 est encapsulée dans un paquet UDP et envoyée via un tunnel VXLAN\
But: creer des sous reseaux (id = VNI)
