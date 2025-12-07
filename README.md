# EXAMDNS

## Whitelist only some Domains with opnsense/unbound

- Set unbounds root zone (`.`) to "refuse"
- answer queries from lines in etc/allow.zone
- BUT refuse e.g. "api.ecosia.org" ("ecosia.org" is in allow)

### Installation

See [INST.md](INST.md)

