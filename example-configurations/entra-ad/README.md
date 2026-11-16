# Microsoft Entra ID authentication for Radiator Policy Server and Radiator Core

This configuration shows how to configure Microsoft Entra ID as authentication backend both on the Radiator side and also the steps needed on the Microsoft Entra ID side.

Check out the _Microsoft-Entra-ID-App-creation-for-Radiator-authentication.pdf_ for more details. Once the Radiator configuration has been updated with the Microsoft Entra ID information, restart Radiator Policy Server and Radiator Core with
`sudo systemctl restart radiator-server`

## Testing

The configuration can be tested for example with:
```
/opt/radiator/server/bin/radiator-client --server 127.0.0.1 --secret mysecret --user <user@entra-domain.com> --password <password>
```

## Clients

In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - ACCOUNTING policy for logging all accounting
  - ENTRA_AUTHENTICATION policy for Microsoft Entra ID authentication.
  - DEFAULT policy for requests that do not match any earlier policy
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

The Entra tenant information is set in `25_pipeline-entra-credentials.radconf`
 - Fill your tenant ID, Application client ID and Application secret here.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
