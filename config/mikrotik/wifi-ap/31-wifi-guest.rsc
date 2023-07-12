/interface wireless security-profiles
add authentication-types=wpa-psk,wpa2-psk \
  comment=wifiguest \
  mode=dynamic-keys \
  name=profile \
  supplicant-identity=MikroTik \
  wpa-pre-shared-key=$secretWifiGuestPassword \
  wpa2-pre-shared-key=$secretWifiGuestPassword

/interface wireless
add comment=wifiguest disabled=no mac-address=$secretWifiGuest2GMac master-interface=wlan1 name=wlan3 security-profile=profile ssid=$secretWifiGuest2GName
add comment=wifiguest disabled=no mac-address=$secretWifiGuest5GMac master-interface=wlan2 name=wlan4 security-profile=profile ssid=$secretWifiGuest5GName

/interface bridge filter
add action=drop chain=forward comment=wifiguest in-interface=wlan3
add action=drop chain=forward comment=wifiguest out-interface=wlan3
add action=drop chain=forward comment=wifiguest in-interface=wlan4
add action=drop chain=forward comment=wifiguest out-interface=wlan4

/interface bridge port
add bridge=bridge comment=wifiguest interface=wlan3
add bridge=bridge comment=wifiguest interface=wlan4
