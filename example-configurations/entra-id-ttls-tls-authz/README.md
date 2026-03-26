# Microsoft Entra ID authentication and authorisation example for the Radiator 10

## Summary

This configuration shows how to configure Microsoft Entra ID as a authentication and authorisation backend both on the Radiator side and also the steps needed on the Microsoft Entra ID side. The username - password authentication and authorisation is supported with EAP-TTLS+PAP and the client certificate authentication is supported with EAP-TLS with Microsoft Entra ID authorisation backend.

Check out the _Microsoft Entra ID App creation for Radiator authentication.pdf_ for the configuration to be done via Microsoft's Entra ID management interfaces. Once the necessary details have been gathered from Microsoft's Entra ID management interface and the Radiator configuration (`/var/lib/radiator/30_backends-entra.radconf`) has been updated with the Microsoft Entra ID information, restart Radiator 10 with
`sudo systemctl restart radiator-server`


## Testing

The configuration can be tested for example with:
```
/opt/radiator/server/testutils/radiator-client --auth-port 1812 --acct-port 1813 --secret mysecret --user <user@entra-domain.com> --password <password> --timeout 120
```

The `--timeout` is important on the test command, as accepting the MFA takes some time from the user.

## Clients

In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration

Policy configuration in `50_policies.radconf`

  - The Entra ID authentication and authorisation policy (`ENTRA_ID`)
  - ACCOUNTING is handled by the ACCOUNTING handler within the policy
  - ENTRA_ID_AUTHENTICATION_EAP handler is for the Microsoft Entra ID authentication and authorisation with both EAP-TLS and EAP-TTLS.
  - DEFAULT handler is for catching requests, which do not match other handlers

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
