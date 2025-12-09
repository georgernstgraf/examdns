# tech notes

## nmap scan json output

`nmap -sn -n -PR -oX - 192.168.21.0/24 | python3 -c "import sys, json, xml.etree.ElementTree as ET; root=ET.fromstring(sys.stdin.read()); print(json.dumps([{'ip': h.find(\"./address[@addrtype='ipv4']\").get('addr'), 'mac': (h.find(\"./address[@addrtype='mac']\").get('addr') if h.find(\"./address[@addrtype='mac']\") is not None else None), 'vendor': (h.find(\"./address[@addrtype='mac']\").get('vendor') if h.find(\"./address[@addrtype='mac']\") is not None else None)} for h in root.findall('host')], indent=2))"`

## createmedium vbox

`VBoxManage createmedium disk --filename "Orbsmart_Raw.vmdk" --format VMDK --variant RawDisk --property RawDrive=/dev/zvol/rpool/orbsmart`

## Q: I want as little caching of negative DNS responses as possible.

### A: not cached are

- "servfail" (unbound does not implement this for local_zone) or
- "refused" (unbounds type: "refuse").

The current code uses "always_refuse", whereas

- nxdomain (cachetime: negative ttl) (type: static and no local data)
- nodata (cachetime negative ttl) (type: static and no local data)
- notimp (!!)

are possibly cached. I want to reduce the caching on the client side, for example if "fontawesome.com" is required for a site but it I add it late to the allow.zone, I'd like it to work as immediately as possible for the student.

## Q: Do not allocate USB-ETH devices on ubuntu

### A: /etc/NetworkManager/conf.d/99-usb-passthrough.conf
