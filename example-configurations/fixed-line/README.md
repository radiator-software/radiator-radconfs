# FTTP, xDSL and other fixed line configuration for the Radiator 10

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration
  - Policies which are selected based on the client identifier to showcase returning attributes from the SQL. There is a example SQL schema available under sql-schema directory, that can be used to create a database matching the configuration on /var/lib/radiator/30_backends.radconf
    - It is also possible to use your own database, in that case the connection and query details in /var/lib/radiator/30_backends.radconf must be updated to match your database
  - DEFAULT policy for catching requests, which do not match other handlers
  - Policies have example conditions, when checking the conditions the policy with first match is used.


## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
