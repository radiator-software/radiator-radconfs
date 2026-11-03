# Enterprise Wi-Fi (EAP) configuration for Radiator Policy Server and Radiator Core

All file/path references in this document assume that the Radiator Policy Server and Radiator Core
package has been installed and this configuration is used as the
default configuration.

## Features

* Enterprise Wi-Fi EAP support for 802.1X/WPA Enterprise authentication
    * EAP-TLS: client certificate authentication with client CA directory support and certificate revocation list (CRL) checking
    * EAP-TTLS/PEAP: username-password authentication using template managed JSONFile backend
    * EAP-TEAP: username-password authentication with PAP using the same backend (for more EAP-TEAP examples, including machine and user authentication with EAP-TLS and EAP-MSCHAPv2, see the eap-teap-windows example)

* Both RADIUS and RadSec (RADIUS over TLS) server support
    * RadSec clients are authenticated with client certificates

## Clients

RADIUS clients are currently configured in `40_clients-radius.radconf` using radconf template `templates/40_clients-radius.radtmpl`.

* The RADIUS or RadSec servers used for RADIUS clients are configured in the RADIUS servers configuration at `40_servers-radius.radconf`
* In addition to example clients, there is a default (0.0.0.0/0) client with the RADIUS secret `ThisIsAnExampleSecret` and with name/identifier `EAP_CLIENT_DEFAULT_IPV4`
* Policies in `50_policies.radconf` are selected by request type, not by client name: accounting requests are processed by the ACCOUNTING policy, PAP requests from any client by the PAP policy, and EAP requests as well as other requests from RadSec clients by the EAP policy
* All RadSec clients are authenticated with client certificate

A radconf template (`templates/40_clients-radius.radtmpl`) is provided and used for managing the internal RADIUS clients configuration (`40_clients-radius.radconf`). Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.
## Policies

Policy configuration in `50_policies.radconf`:

* ACCOUNTING policy for logging all accounting
* PAP policy for PAP only authentication
* EAP policy for EAP only authentication, contains example of VLAN assignment
* DEFAULT policy for catching requests, which do not match other policies
* The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

## Certificate Revocation List

EAP-TLS client certificates are checked against a certificate revocation list (CRL) configured in `15_certificates-eap-server-crl.radconf`:

* Replace the CRL file when you replace the client CA. Use a `crl_directory` block instead to refresh CRLs automatically
* A CRL is valid until its next update time, set by the CA. After that time the CRL is stale, and all EAP-TLS client certificates checked against it are rejected, also certificates that are not revoked, until a newer CRL is loaded. Set `allow_stale yes;` in the `crl` block to accept clients while the CRL is stale. Revoked certificates are still rejected

See [Certificate Revocation Lists](https://docs.radiatorsoftware.com/latest/docs/articles/certificate-revocation-list/) for more information.

## Internal Users

Internal users (e.g. the users authenticated locally by server for Wi-Fi access) are also managed by a radconf template (`users-internal.json5.radtmpl`):

* The users must be managed via user interface with the provided template; manual edits of JSON5 may cause problems with the UI integration
* The users are stored in a custom JSON5 file at `db/users-internal/users-internal.json5`
* Initial usernames and passwords in the file:

```json
{
  "users": [
    {
      "username": "mikem",
      "password": "fred"
    },
    {
      "username": "batman",
      "password": "TheHeroGothamDeserves"
    },
    {
      "username": "alfred",
      "password": "TheButlerDidIt"
    },
    {
      "username": "robin",
      "password": "HolyPasswordBatman"
    }
  ]
}
```

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
