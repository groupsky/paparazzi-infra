/interface wireless
set [ find default-name=wlan1 ] \
  band=2ghz-b/g/n \
  channel-width=20/40mhz-XX \
  country=bulgaria \
  disabled=no \
  distance=indoors \
  frequency=auto \
  installation=indoor \
  mode=ap-bridge \
  ssid=$secretWifi2GName \
  wireless-protocol=802.11
set [ find default-name=wlan2 ] \
  band=5ghz-a/n/ac \
  channel-width=20/40/80mhz-XXXX \
  country=bulgaria \
  disabled=no \
  distance=indoors \
  frequency=auto \
  installation=indoor \
  mode=ap-bridge \
  ssid=$secretWifi5GName \
  wireless-protocol=802.11

/interface wireless security-profiles
set [ find default=yes ] \
  authentication-types=wpa-psk,wpa2-psk \
  mode=dynamic-keys \
  supplicant-identity=MikroTik \
  wpa-pre-shared-key=$secretWifiPassword \
  wpa2-pre-shared-key=$secretWifiPassword
