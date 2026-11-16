# Minimal default configuration with Microsoft Entra ID and MFA for UI

This example uses Microsoft Entra ID authentication with MFA push notification for Radiator UI login together with the default local authentication. Usernames with a realm are looked up in Microsoft Entra ID, and local accounts without a realm, such as `admin`, keep working when Microsoft Entra ID is not accessible. The example needs both ROPC and Client credentials flow, so the Microsoft Entra application must fulfill permission requirements of both flows.

Check out the Configuration guide for the configurations that need to be done both on Radiator Policy Server and Radiator Core and on Microsoft's Entra ID.

The Entra tenant information is set in `management/25_pipeline-entra-credentials.radconf`
 - Fill your tenant ID, Application client ID, Application secret and the secret from the provision-mfa-secret.ps1 script (included in the entra-auth-mfa example) either from CLI or from Radiator UI

NOTE: Select "Management configuration (management/)" checkbox when importing.

By default the import removes existing configuration, but Radiator UI will automatically show in-memory logs for the application. If there is e.g. error in the Entra authentication, it's visible in Radiator UI logs. The included 15_logging.radconf also writes the logs to files under `/var/log/radiator/`.

## Radiator UI
This example has Radiator UI activated:
 * Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
