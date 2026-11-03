# Microsoft Entra ID authentication and authorisation example for Radiator Policy Server and Radiator Core

## Summary

This configuration shows how to configure Microsoft Entra ID as a authentication and authorisation backend both on the Radiator side and also the steps needed on the Microsoft Entra ID side. The username - password authentication and authorisation is supported with EAP-TTLS+PAP and the client certificate authentication is supported with EAP-TLS with Microsoft Entra ID authorisation backend.

Check out the _Microsoft-Entra-ID-App-creation-for-Radiator-authentication.pdf_ for the configuration to be done via Microsoft's Entra ID management interfaces. Once the necessary details have been gathered from Microsoft's Entra ID management interface and the Radiator configuration (`/var/lib/radiator/30_backends-entra.radconf`) has been updated with the Microsoft Entra ID information, restart Radiator Policy Server and Radiator Core with
`sudo systemctl restart radiator-server`


## Testing

The configuration accepts only EAP-TTLS with inner PAP and EAP-TLS requests, so test it with eapol_test using the example configurations in `/opt/radiator/server/testutils/`. For EAP-TTLS, set the identity and password in `test-eap-ttls-pap-valid.conf` to match a user in Microsoft Entra ID and run:
```
/opt/radiator/server/bin/eapol_test -s mysecret -c /opt/radiator/server/testutils/test-eap-ttls-pap-valid.conf
```

For EAP-TLS, set the client certificate in `test-eap-tls-valid.conf` to one whose email address matches a user in Microsoft Entra ID and run:
```
/opt/radiator/server/bin/eapol_test -s mysecret -c /opt/radiator/server/testutils/test-eap-tls-valid.conf
```

## Clients

In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration

Policy configuration in `50_policies.radconf`

  - The Entra ID authentication and authorisation policy (`ENTRA_ID`)
  - ACCOUNTING is handled by the ACCOUNTING handler within the policy
  - ENTRA_ID_AUTHENTICATION_EAP handler is for the Microsoft Entra ID authentication and authorisation with both EAP-TLS and EAP-TTLS.
  - DEFAULT handler is for catching requests, which do not match other handlers

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
