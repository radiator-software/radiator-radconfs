# Radiator 10 configuration for AD authentication
## Summary

To use this configuration, in addition of configuring the clients edit the AD information (url, authentication details and filters) in /var/lib/radiator/30_backends.radconf

Radiator 10 can be started with `sudo systemctl start radiator-server` on the command line.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - AUTHENTICATIONS with handlers for rejecting invalid usernames and realms and AD authentication with optional group query
  - ACCOUNTING policy for logging all accounting
  - DEFAULT policy for catching requests, which do not match other policies
  - Both policies and handlers have example conditions, when checking the conditions the policy/handler with first match is used

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
