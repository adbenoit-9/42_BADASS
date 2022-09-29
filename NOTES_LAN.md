# LAN (Local Area Network)
[link](https://www.cloudflare.com/fr-fr/learning/network-layer/what-is-a-lan/)

### Resume
A local area network (LAN) est un réseau situé dans une petite zone géographique, généralement dans le même bâtiment. (wifi / ethernet)
utilise des switch ou des routeurs pour e traffic des donnees.
- couche 2: transmet les données en fonction de l'adresse MAC de destination
- couche 3: transmet les données en fonction de l'adresse IP de destination

### Modele OSI
*Open Systems Interconnection*\
[link](https://www.cloudflare.com/fr-fr/learning/ddos/glossary/open-systems-interconnection-model-osi/)

L'OSI constitue une norme permettant à différents systèmes informatiques de communiquer entre eux.
Divise le systeme de communication en 7 couches:
1. Couche physique (physical layer): tansmission des donnees via un cable => flux binaire
2. Couche de liaison de donnees (data link layer): divise les packets de la couche 3 en morceaux (frames)
3. Couche reseau (network layer): decompose les segments de la couche 4 en unite plus petites (packet) + trouve le meilleur chemin physique pour transmettre les donnees (routage)
4. Couche de transport (transport layer): recupere les segments de la couche 5 pour les envoyer a la couche 3 + controle flux, erreurs
5. Couche de session (session layer): ouvre et ferme la communication, synchronise le transfert de donnees avec des points de controle
6. Couche de presentation (presentation layer): responsable de la traduction, chiffrement et compression des donnees. Optimise la communication
7. Couche applicative (application layer): interagit avec les donnees de l'utilisateur (ex: http)


### Switch
[link](https://www.cloudflare.com/fr-fr/learning/network-layer/what-is-a-network-switch/)

= commutateur de reseau: connecte des appareils au sein d'un reseau

- CAM (Content Addressable Memory): une table qui associe les adresses MAC aux ports Ethernet du commutateur de couche 2, que le commutateur socke en memoire.


