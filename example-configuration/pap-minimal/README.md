Mimimal PAP authentication configuration for the Radiator 10

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - DEFAULT policy with various handlers
    - AUTHENTICATION handler for RADIUS authentication, authentication is done from a flat file located in /var/lib/radiator/db/users-internal/users-internal.file
    - ACCOUNTING handler for logging all accounting
    - DEFAULT handler for catching requests, which do not match other handlers
  - Handlers have examples of conditions, which are checked to see which handler matches. The first match is used.
