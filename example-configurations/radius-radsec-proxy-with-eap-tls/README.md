# RADIUS RadSec proxy with EAP-TLS configuration for Radiator Policy Server and Radiator Core

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - DEFAULT policy with various handlers
    - Proxy handlers for different realms to proxy the RADIUS and RadSec requests
    - AUTHENTICATION handler for RADIUS authentication
    - ACCOUNTING handler for logging all accounting
    - DEFAULT handler for catching requests, which do not match other handlers
  - Handlers have examples of conditions, which are checked to see which handler matches. The first match is used.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
