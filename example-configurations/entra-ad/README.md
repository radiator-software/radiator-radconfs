# Microsoft Entra ID authentication for the Radiator 10

This configuration shows how to configure Microsoft Entra ID as authentication backend both on the Radiator side and also the steps needed on the Microsoft Entra ID side.

Check out the _Microsoft Entra ID App creation for Radiator authentication.pdf_ for more details. Once the Radiator configuration has been updated with the Microsoft Entra ID information, restart Radiator 10 with
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
  - ACCOUNTING policy for logging all accounting
  - ENTRA_AUTHENTICATION policy for Microsoft Entra ID authentication.
  - DEFAULT policy for catching requests, which do not match other handlers
  - Policies have example conditions, when checking the conditions the policy with first match is used.

The Entra tenant information is set in `25_pipeline-entra-credentials.radconf`
 - Fill your tenant ID, Application client ID and Application secret here.

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
