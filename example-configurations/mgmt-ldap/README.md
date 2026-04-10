# Minimal default configuration with LDAP for UI

This example uses LDAP authentication for the Management UI with a fallback of the default local authentication. This shows how to fallback with local authentication in case the LDAP is not accessible.

## Management UI
This example has Radiator 10 GUI activated:
 * Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: _admin_ and password: _ChangeThisPassword!_
