# Microsoft Entra ID authentication with password and MFA example for the Radiator 10

## Summary
This configuration shows how to configure Microsoft Entra ID as authentication backend both on the Radiator side and also the steps needed on the Microsoft Entra ID side. The username + password authentication is supported with PAP and after that is successfully completed the MFA (multi-factor authentication) triggers.

Check out the Configuration guide for the configurations that need to be done both on the Radiator 10 and on Microsoft's Entra ID.

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
  - ENTRA_AUTHENTICATION policy for Microsoft Entra ID authentication and MFA
  - DEFAULT policy for catching requests, which do not match other handlers
  - Policies have example conditions, when checking the conditions the policy with first match is used.

The Entra tenant information is set in `25_pipeline-entra-credentials.radconf`
 - Fill your tenant ID, Application client ID, Application secret and the secret from provision-mfa-secret.ps1 script

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
