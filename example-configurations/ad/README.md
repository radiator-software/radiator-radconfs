# Radiator Policy Server and Radiator Core configuration for AD authentication
## Summary

To use this configuration, in addition of configuring the clients edit the AD information (url, authentication details and filters) in /var/lib/radiator/30_backends.radconf

Radiator Policy Server and Radiator Core can be started with `sudo systemctl start radiator-server` on the command line.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - AUTHENTICATIONS with handlers for rejecting invalid usernames and realms and AD authentication with optional group query
  - ACCOUNTING policy for logging all accounting
  - DEFAULT policy for catching requests, which do not match other policies
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
