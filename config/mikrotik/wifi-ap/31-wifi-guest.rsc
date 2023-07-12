/interface wireless security-profiles
remove [ find comment=wifiguest ]
add authentication-types=wpa-psk,wpa2-psk \
  comment=wifiguest \
  mode=dynamic-keys \
  name=profile \
  supplicant-identity=MikroTik \
  wpa-pre-shared-key=$wifiGuestPassword \
  wpa2-pre-shared-key=$wifiGuestPassword

/interface wireless
remove [ find comment=wifiguest ]
add comment=wifiguest disabled=no mac-address=$wifiGuest2GMac master-interface=wlan1 name=wlan4 security-profile=profile ssid=$wifiGuest2GName
add comment=wifiguest disabled=no mac-address=$wifiGuest5GMac master-interface=wlan2 name=wlan3 security-profile=profile ssid=$wifiGuest5GName

/interface bridge filter
remove [ find comment=wifiguest ]
add action=drop chain=forward comment=wifiguest in-interface=wlan3
add action=drop chain=forward comment=wifiguest out-interface=wlan3
add action=drop chain=forward comment=wifiguest in-interface=wlan4
add action=drop chain=forward comment=wifiguest out-interface=wlan4

/interface bridge port
remove [ find comment=wifiguest ]
add bridge=bridge comment=wifiguest interface=wlan3
add bridge=bridge comment=wifiguest interface=wlan4
