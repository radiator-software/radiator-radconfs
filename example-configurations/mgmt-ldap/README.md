# Minimal default configuration with LDAP for UI

This example uses LDAP authentication for Radiator UI with a fallback of the default local authentication. Local users are used when LDAP is not accessible or the user is not found in LDAP.

NOTE: Select "Management configuration (management/)" checkbox when importing.

By default the import removes existing configuration, but Radiator UI will automatically show in-memory logs for the application. If there is e.g. error in the LDAP authentication, it's visible in Radiator UI logs. The included 15_logging.radconf also writes the logs to files under `/var/log/radiator/`.

## Radiator UI
This example has Radiator UI activated:
 * Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
