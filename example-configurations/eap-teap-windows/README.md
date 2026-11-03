# EAP-TEAP configuration for Windows 11 machine and user authentication

## Summary
EAP-TEAP configuration example with both machine and user authentication for Windows. Example shows EAP-TEAP with inner EAP-TLS (machine) and EAP-MSCHAPv2 (user) authentications using Radiator demo certificates.

For the outer TLS tunnel, only TLS 1.2 is supported. For inner EAP-TLS, TLS v1.3 can also be used. The Radiator Policy Server and Radiator Core configuration and the Windows configuration must match. For example,
if user authentication uses EAP-TLS instead of EAP-MSCHAPv2, change the secondary EAP method in Windows to EAP-TLS as well. If the Radiator Policy Server and Radiator Core configuration is changed to contain only
user or machine authentication with EAP-MSCHAPv2, set the primary EAP method in Windows to EAP-MSCHAPv2 and set the secondary method to none.

Refer to the [EAP-TEAP Windows Configuration Guide](https://files.radiatorsoftware.com/policyserver/eap-teap-windows-configuration-guide.pdf) for manual Windows side configuration, available also as PDF in this zip.

## Certificates
The example uses Radiator demo certificates from `/var/lib/radiator/tls/`. The demo certificates are for testing only and must not be used in production.

Radiator Server uses the `server-I2-certchain.pem` server certificate and accepts client certificates issued by intermediate CA I2. Import these files on the Windows device:
  - `tls/ca/root-CA-crt.pem` into `Local Computer -> Trusted Root Certification Authorities`
  - `tls/certs/client-I2-certchain.p12` into `Local Computer -> Personal` as the machine certificate for EAP-TLS. The import password is `whatever`.

Use `test.server.example.com` as the server name in the Windows TEAP and EAP-TLS settings.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Policies
Policy configuration in `50_policies.radconf`
  - ACCOUNTING policy for logging all accounting
  - AUTHENTICATION policy for machine and user EAP-TEAP authentication
  - DEFAULT policy for catching requests, which do not match other policies
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
