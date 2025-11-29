# Installation auf HP Notebook -- logs

## System -> Settings -> General

- DNS Servers: Leer lassen oder machen
- check: Allow DNS server list to be overridden by DHCP/PPP on WAN
- check: Do not use the local DNS service as a nameserver for this system

## Services -> Unbound DNS -> Query Forwarding

- check: Use System Nameservers

## Services -> Unbound DNS -> Advanced

- check: log Queries
- check: log Replies
- check: tag Queries and Replies

## Firewall -> NAT -> Port Forward

- redirect all DNS Traffic that targets "not this firewall" to 127.0.0.1

## Alias ub

- `alias ub='unbound-control -c /var/unbound/unbound.conf`
- `alias ut='tail -F /var/log/resolver/latest.log'`
