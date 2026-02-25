# EAP-TLS authentication with Microsoft Entra ID authorisation configuration

## Summary

This configuration shows how to configure Microsoft Entra ID as an authorisation backend for EAP-TLS authentication.

Check out the EAP TLS Entra ID configuration guide for the configurations that need to be done both on the Radiator 10 and on Microsoft's Entra ID.

## Testing

To test with this configuration, use the instructions in the configuration guide to set up.

Authentication can be tested for example with:
```
/opt/radiator/server/testutils/radiator-client --auth-port 1812 --acct-port 1813 --secret mysecret --user <user@entra-domain.com> --password <password> --timeout 120
```

The `--timeout` is important on the test command, as accepting the MFA takes some time from the user.

## Adding RADIUS Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`. Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Policies

Policy configuration in `50_policies.radconf`
  - ACCOUNTING policy for logging all accounting
  - ENTRA_ID EAP-TLS authentication with group check for authorization from Entra.
  - DEFAULT policy for catching requests, which do not match other handlers
  - Policies have example conditions, when checking the conditions the policy with first match is used.

## Management UI

This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in /var/lib/radiator/management/
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: *admin*
  - Default password: *ChangeThisPassword!*
