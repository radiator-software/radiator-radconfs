# Radiator 10 configuration for local authentication with LDAP authorization while proxying rest to eduroam
## Summary

To use this configuration, in addition of configuring the clients edit the LDAP information (url and authentication details), SQL information (connection details) and RadSec server details in /var/lib/radiator/30_backends.radconf

The SQL and LDAP query details are located in /var/lib/radiator/30_backends.radconf, an example schema for SQL is available under _sql-schema_ directory

Radiator 10 can be started with `sudo systemctl start radiator-server`

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - AUTHENTICATIONS with handlers for rejecting invalid usernames and realms, local authentication with LDAP authorization and Eduroam proxy
  - ACCOUNTING policy for logging all accounting
  - DEFAULT policy for catching requests, which do not match other handlers
  - Both policies and handlers have example conditions, when checking the conditions the policy/handler with first match is used.

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
