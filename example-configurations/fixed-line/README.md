# FTTP, xDSL and other fixed line configuration for Radiator Policy Server and Radiator Core

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
  - Policies which are selected based on the client identifier (`ALC-BNG-1` and `ALC-BNG-2-PAP`, which must be added to `40_clients-radius.radconf`) to showcase returning attributes from the SQL. There is a example SQL schema available under sql-schema directory, that can be used to create a database matching the configuration on /var/lib/radiator/30_backends.radconf
    - It is also possible to use your own database, in that case the connection and query details in /var/lib/radiator/30_backends.radconf must be updated to match your database
  - DEFAULT policy for requests that do not match any earlier policy
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.


## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
