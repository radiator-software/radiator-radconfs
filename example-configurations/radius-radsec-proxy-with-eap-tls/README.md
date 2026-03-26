# RADIUS RadSec proxy with EAP-TLS configuration for the Radiator 10

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - DEFAULT policy with various handlers
    - Proxy handlers for different realms to proxy the RADIUS and RadSec requests
    - AUTHENTICATION handler for RADIUS authentication
    - ACCOUNTING handler for logging all accounting
    - DEFAULT handler for catching requests, which do not match other handlers
  - Handlers have examples of conditions, which are checked to see which handler matches. The first match is used.

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
