# Minimal default configuration with Microsoft Entra ID and MFA for UI

This example uses Microsoft Entra ID authentication with MFA push notification for the Management UI login with a fallback of the default local authentication. This shows how to fallback with local authentication in case the Microsoft Entra is not accessible. The example needs both ROPC and Client credentials flow, so the Microsoft Entra application must fulfill permission requirements of both flows.

Check out the Configuration guide for the configurations that need to be done both on the Radiator 10 and on Microsoft's Entra ID.

The Entra tenant information is set in `25_pipeline-entra-credentials.radconf`
 - Fill your tenant ID, Application client ID, Application secret and the secret from provision-mfa-secret.ps1 script either from CLI or from GUI

NOTE: Select "Management configuration (management/)" checkbox when importing.

By default the import removes existing configuration, but the GUI will automatically show in-memory logs for the application. If there is e.g. error in the Entra authentication, it's visible on the GUI logs. If the same information is wanted to a file, 15_logging.radconf and 15_templates-logging.radconf configuration files are needed.

## Management UI
This example has Radiator 10 GUI activated:
 * Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: _admin_ and password: _ChangeThisPassword!_
