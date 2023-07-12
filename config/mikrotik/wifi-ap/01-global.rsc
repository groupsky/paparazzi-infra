#######################################
# Global Variables
#######################################
# Timezone
:global TIMEZONE Europe/Sofia
:global NTPSERVERS bg.pool.ntp.org

# LAN Configuration
:global lanNetwork $secretLanNetwork
:global lanNetworkBits $secretLanNetworkBits
:global lanDhcpRange $secretLanDhcpRange

# Wifi Configuration
:global wifi2GName $secretWifi2GName
:global wifi5GName $secretWifi5GName
:global wifiPassword $secretWifiPassword
:global wifiGuest2GName $secretWifiGuest2GName
:global wifiGuest5GName $secretWifiGuest5GName
:global wifiGuestPassword $secretWifiGuestPassword
:global wifiGuest2GMac $secretWifiGuest2GMac
:global wifiGuest5GMac $secretWifiGuest5GMac

# Wireguard Site 2 Site configuration
:global wgS2SLocalPort $secretWgS2SLocalPort
:global wgS2SLocalPrivateKey $secretWgS2SLocalPrivateKey
:global wgS2SRemoteAddress $secretWgS2SRemoteAddress
:global wgS2SRemotePort $secretWgS2SRemotePort
:global wgS2SRemotePublicKey $secretWgS2SRemotePublicKey
:global wgS2SRemoteNetwork $secretWgS2SRemoteNetwork
:global wgS2SRemoteNetworkBits $secretWgS2SRemoteNetworkBits
