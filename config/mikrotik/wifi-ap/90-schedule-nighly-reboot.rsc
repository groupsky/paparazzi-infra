/system scheduler
remove [ find name="Nightly reboot" ]
add interval=1d name="Nightly reboot" on-event="/system reboot" \
  policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
  start-date=jan/01/1970 \
  start-time=03:12:45
