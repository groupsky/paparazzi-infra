# Site to site Wireguard tunnel
# https://help.mikrotik.com/docs/display/ROS/WireGuard#WireGuard-SitetoSiteWireGuardtunnel

# cleanup existing config
/ip/firewall/filter remove [ find comment=wgs2s ]
/ip/route remove [ find comment=wgs2s ]
/ip/address remove [ find comment=wgs2s ]
/interface/wireguard/peers remove [ find comment=wgs2s ]
/interface/wireguard remove [ find comment=wgs2s ]

# create new interface
/interface/wireguard add comment=wgs2s listen-port=$wgS2SLocalPort name=wg-remote private-key=$wgS2SLocalPrivateKey
# add the remote peer
/interface/wireguard/peers add \
  allowed-address="$wgS2SRemoteNetwork/$wgS2SRemoteNetworkBits" \
  comment=wgs2s \
  endpoint-address=$wgS2SRemoteAddress \
  endpoint-port=$wgS2SRemotePort \
  interface=wg-remote \
  public-key=$wgS2SRemotePublicKey

# allow traffic through the tunnel
/ip/address add comment=wgs2s address=10.255.255.1/30 interface=wg-remote
/ip/route add comment=wgs2s dst-address=$wgS2SRemoteNetwork gateway=wg-remote

# configure the firewall
/ip/firewall/filter
# accept the traffic
add action=accept chain=input comment=wgs2s dst-port=$wgS2SLocalPort protocol=udp src-address=$wgS2SRemoteAddress
# and forward it between the networks
add action=accept chain=forward comment=wgs2s dst-address="$lanNetwork/$lanNetworkBits" src-address="$wgS2SRemoteNetwork/$wgS2SRemoteNetworkBits"
add action=accept chain=forward comment=wgs2s dst-address="$wgS2SRemoteNetwork/$wgS2SRemoteNetworkBits" src-address="$lanNetwork/$lanNetworkBits"
