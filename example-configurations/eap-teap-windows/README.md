# EAP-TEAP configuration for Windows 11 machine and user authentication

## Summary
EAP-TEAP configuration example with both machine and user authentication for Windows. Example shows EAP-TEAP with inner EAP-TLS (machine) and EAP-MSCHAPv2 (user) authentications using Radiator demo certificates.

For the outer TLS tunnel, only TLS 1.2 is supported. For inner EAP-TLS, TLS v1.3 can also be used. The Radiator Policy Server configuration and the Windows configuration must match. For example, if user authentication uses EAP-TLS instead of EAP-MSCHAPv2, change the secondary EAP method in Windows to
EAP-TLS as well. If the Radiator Policy Server configuration is changed to contain only user or machine authentication with EAP-MSCHAPv2, set the primary EAP method in Windows to EAP-MSCHAPv2 and set the secondary method to none.

Refer to the [EAP-TEAP Windows Configuration Guide](https://files.radiatorsoftware.com/policyserver/eap-teap-windows-configuration-guide.pdf) for manual Windows side configuration, available also as PDF in this zip.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Policies
Policy configuration in `50_policies.radconf`
  - ACCOUNTING policy for logging all accounting
  - AUTHENTICATION policy for machine and user EAP-TEAP authentication
  - DEFAULT policy for catching requests, which do not match other policies
  - Policies have examples of conditions, which are checked to see which policy is a matching one. Only the first matching policy is processed.

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
