# Enterprise Wi-Fi (EAP) configuration for the Radiator 10
All file/path references in this document assume that the Radiator 10
package has been installed and this configuration is used as the
default configuration.

## Summary
* Enterprise Wi-Fi EAP support for 802.1X/WPA Enterprise authentication
  * EAP-TLS: client certificate authentication with client CA directory support
  * EAP-TTLS: username-password authentication using internal SQL database
  * PEAP: username-password authenticaiton using internal SQL database
  * TEAP: username-password authentication using internal SQL database

 * Both RADIUS and RadSec (RADIUS over TLS) server support
 * RadSec clients are authenticated with client certificates

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.
## Policies
Policy configuration in `50_policies.radconf`
 * ACCOUNTING policy for logging all accounting
 * PAP policy for PAP only authentication
 * EAP policy for EAP only authentication, contains example of VLAN assignment
 * DEFAULT policy for catching requests, which do not match other policies
 * Policies have examples of conditions, which are checked to see which policy is a matching one. Only the first matching policy is processed.

## Management UI
This example has Radiator 10 GUI activated:
 * Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: _admin_ and password: _ChangeThisPassword!_
