#######################################
# Global Secrets (template)
#######################################
# LAN Configuration
:global secretLanNetwork 192.168.88.0
:global secretLanNetworkBits 24
:global secretLanDhcpRange 192.168.88.10-192.168.88.254

# Wifi Configuration
:global secretWifi2GName privateWifi2G
:global secretWifi5GName privateWifi5G
:global secretWifiPassword "wifiPassword"
:global secretWifiGuest2GName guestWifi2G
:global secretWifiGuest5GName guestWifi5G
:global secretWifiGuestPassword "wifiPassword"
:global secretWifiGuest2GMac 4A:8F:5A:A2:AA:59
:global secretWifiGuest5GMac 4A:8F:5A:A2:AA:5A

# Wireguard Site 2 Site configuration
:global secretWgS2SLocalPort 51820
:global secretWgS2SLocalPrivateKey "yKt9NJ4e5qlaSgh48WnPCDCEkDmq+VsBTt/DDEBWfEo="
:global secretWgS2SRemoteAddress 192.168.80.1
:global secretWgS2SRemotePort 51820
:global secretWgS2SRemotePublicKey "v/oIzPyFm1FPHrqhytZgsKjU7mUToQHLrW+Tb5e601M="
:global secretWgS2SRemoteNetwork 192.168.77.0
:global secretWgS2SRemoteNetworkBits 24
