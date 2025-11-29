# unbound-onlywhite

## Make an Exam Environment by whitelisting only allowed Domains aka. Websites

The idea to this was born at scool, where I have to exam students periodically. IMO it should be possible for them to access some parts
of the internet (where the docs live), but no ChatGPT and friends, webmail sites and other cheating opportunities. So I built this script (`exam.py`) here based on OPNSense and the unbound resolver. The main "trick" is to set the root zone (`.`) to "refuse" and from there down gently open up the sites that should be able to use. Have a look at the files in the `etc` dir. Have in mind, that, if you allow "ecosia.org" for example, this implicitly also allows "api.ecosia.org", which you probably want to block separately in the *.deny.zone file. As alternative one could just allow "www.ecosia.org".

### clone repo

- git clone this repository as `root` into `/root` (or just extract the zipfile/tarball)

#### block dangerous stuff

- prohibit other cheating opportunities like port 22

### optional OPNSense fiddlery

- exam.py knows this

### working with unbound-control

This is basically done by invoking `exam.py`.

## FAQ

Q: What is the status of this project?

A: This is a first shot, now version numbers. I'm still not sure whether this makes sense over using squid or some other proxy. Finally,

Q: Which nmap command to use to see who responds to arp on my net?

A: /usr/local/bin/nmap -sn -n 192.168.0.0/24

Q: add a custom cronjob on opnsense

A: /usr/local/opnsense/service/conf/actions.d/actions_exampy.conf

```ini
[nmap]
type:script
command:/root/unbound-onlywhite/bin/exampy_cron.sh
message:Executing Nmap in local LAN
description:exampy nmap
```

Q: I want as little caching of negative DNS responses as possible.

A: not cached are

- "servfail" (unbound does not implement this for local_zone) or
- "refused" (unbounds type: "refuse").

The current code uses "always_refuse", whereas

- nxdomain (cachetime: negative ttl) (type: static and no local data)
- nodata (cachetime negative ttl) (type: static and no local data)
- notimp (!!)

are possibly cached. I want to reduce the caching on the client side, for example if "fontawesome.com" is required for a site but it I add it late to the allow.zone, I'd like it to work as immediately as possible for the student.
