# EAP-TLS authentication with Microsoft Entra ID authorisation configuration

## Summary

This configuration shows how to configure Microsoft Entra ID as an authorisation backend for EAP-TLS authentication.

Check out the EAP TLS Entra ID configuration guide for the configurations that need to be done both on Radiator Policy Server and Radiator Core and on Microsoft's Entra ID.

## Testing

To test with this configuration, use the instructions in the configuration guide to set up.

The configuration accepts only EAP-TLS requests, so test it with eapol_test using the example configurations in `/opt/radiator/server/testutils/`. Set the client certificate in `test-eap-tls-valid.conf` to one whose email address matches a user in Microsoft Entra ID and run:
```
/opt/radiator/server/bin/eapol_test -s mysecret -c /opt/radiator/server/testutils/test-eap-tls-valid.conf
```

## Adding RADIUS Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`. Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Policies

Policy configuration in `50_policies.radconf`
  - ENTRA_ID policy for EAP-TLS authentication with group checks for authorization from Entra
  - ACCOUNTING handler within ENTRA_ID for logging all accounting
  - DEFAULT handler within ENTRA_ID for requests that do not match an earlier handler
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

## Radiator UI

This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in /var/lib/radiator/management/
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin`
  - Default password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
