# Site to site Wireguard tunnel
# https://help.mikrotik.com/docs/display/ROS/WireGuard#WireGuard-SitetoSiteWireGuardtunnel

# cleanup existing config
/ip/firewall/filter remove [ find comment=wgs2s ]
/ip/route remove [ find comment=wgs2s ]
/ip/address remove [ find comment=wgs2s ]
/interface/wireguard/peers remove [ find comment=wgs2s ]
/interface/wireguard remove [ find comment=wgs2s ]

# create new interface
/interface/wireguard add comment=wgs2s listen-port=$secretWgS2SLocalPort name=wg-remote private-key=$secretWgS2SLocalPrivateKey
# add the remote peer
/interface/wireguard/peers add \
  allowed-address=$secretWgS2SRemoteNetwork$secretWgS2SRemoteNetworkBits \
  comment=wgs2s \
  endpoint-address=$secretWgS2SRemoteAddress \
  endpoint-port=$secretWgS2SRemotePort \
  interface=wg-remote \
  public-key=$secretWgS2SRemotePublicKey

# allow traffic through the tunnel
/ip/address add comment=wgs2s address=10.255.255.1/30 interface=wg-remote
/ip/route add comment=wgs2s dst-address=$secretWgS2SRemoteNetwork gateway=wg-remote

# configure the firewall
/ip/firewall/filter
# accept the traffic
add action=accept chain=input comment=wgs2s dst-port=$secretWgS2SLocalPort protocol=udp src-address=$secretWgS2SRemoteAddress
# and forward it between the networks
add action=accept chain=forward comment=wgs2s dst-address=$secretLanNetwork$secretLanNetworkBits src-address=$secretWgS2SRemoteNetwork$secretWgS2SRemoteNetworkBits
add action=accept chain=forward comment=wgs2s dst-address=$secretWgS2SRemoteNetwork$secretWgS2SRemoteNetworkBits src-address=$secretLanNetwork$secretLanNetworkBits
