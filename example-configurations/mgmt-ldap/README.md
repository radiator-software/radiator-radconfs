# Minimal default configuration with LDAP for UI

This example uses LDAP authentication for the Management UI with a fallback of the default local authentication. This shows how to fallback with local authentication in case the LDAP is not accessible.

NOTE: Select "Management configuration (management/)" checkbox when importing.

By default the import removes existing configuration, but the GUI will automatically show in-memory logs for the application. If there is e.g. error in the LDAP authentication, it's visible on the GUI logs. If the same information is wanted to a file, 15_logging.radconf and 15_templates-logging.radconf configuration files are needed.

## Management UI
This example has Radiator 10 GUI activated:
 * Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: _admin_ and password: _ChangeThisPassword!_
