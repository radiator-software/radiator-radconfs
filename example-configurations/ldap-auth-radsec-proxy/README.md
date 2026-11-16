# Radiator Policy Server and Radiator Core configuration for local authentication with LDAP user lookup and SQL VLAN authorization while proxying rest to eduroam
## Summary

To use this configuration, in addition of configuring the clients edit the LDAP information (url and authentication details), SQL information (connection details) and RadSec server details in /var/lib/radiator/30_backends.radconf

The SQL and LDAP query details are located in /var/lib/radiator/30_backends.radconf, an example schema for SQL is available under _sql-schema_ directory

Radiator Policy Server and Radiator Core can be started with `sudo systemctl start radiator-server`

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - AUTHENTICATIONS with handlers for rejecting invalid usernames and realms, local authentication with LDAP user lookup and SQL VLAN authorization and Eduroam proxy
  - ACCOUNTING policy for logging all accounting
  - DEFAULT policy for requests that do not match any earlier policy
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
