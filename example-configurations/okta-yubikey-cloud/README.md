# Okta authentication for Radiator Policy Server and Radiator Core with Yubikey Cloud

This configuration shows how to configure Okta as authentication backend both on the Radiator side and also the steps needed on the Okta side together with Yubikey Cloud configuration.

Check out the _Okta Application Setup_ for more details. Radiator configuration can be updated with the Okta information from Radiator UI, see more in _Radiator Policy Server Okta configuration guide_

For Yubikey Cloud, Radiator configuration needs to know the user ID and key in base64 format. Fill in the details with "Yubikey details" menu

## Testing

The configuration can be tested for example with:
```
/opt/radiator/server/bin/radiator-client --server 127.0.0.1 --secret mysecret --user <user@okta-domain.com> --password <password><YubikeyOTP>
```

## Clients

In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - ACCOUNTING policy for logging all accounting
  - AUTHENTICATION policy for Okta user and password authentication with Yubikey Cloud check
  - DEFAULT policy for requests that do not match any earlier policy
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

The Okta information is set in `25_pipeline-okta-credentials.radconf`
 - Fill your Okta domain, Authorization server ID, client ID and client secret here.

The Yubikey cloud information is set in `25_pipeline-yubikey-credentials.radconf`
- Fill in your Yubikey ID and key here.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
