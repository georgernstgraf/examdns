# tech notes

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
