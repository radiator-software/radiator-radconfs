# Enterprise Wi-Fi (EAP) configuration for the Radiator 10

All file/path references in this document assume that the Radiator 10
package has been installed and this configuration is used as the
default configuration.

## Features

* Enterprise Wi-Fi EAP support for 802.1X/WPA Enterprise authentication
    * EAP-TLS: client certificate authentication with client CA directory support
    * EAP-TTLS/PEAP/TEAP: username-password authentication using template managed JSONFile backend

* Both RADIUS and RadSec (RADIUS over TLS) server support
    * RadSec clients are authenticated with client certificates

## Clients

RADIUS clients are currently configured in `40_clients-radius.radconf` using radconf template `templates/40_clients-radius.radconf.template`.

* The RADIUS or RadSec server users for RADIUS clients are configured in the RADIUS servers configuration at `40_servers-radius.radconf`
* In addition to example clients, there is a default (0.0.0.0/0) client with the RADIUS secret `ThisIsAnExampleSecret` and with name/identifier `EAP_CLIENT_DEFAULT_IPV4`. All clients with name starting with EAP are processed by EAP policy in the `50_policies.radconf` configuration
* Localhost RADIUS clients are processed by PAP policy in the `50_policies.radconf` configuration
* All RadSec clients are authenticated with client certificate. The requests from these clients are processed by EAP policy in `50_policies.radconf`

A radconf template (`templates/40_clients-radius.radtmpl`) is provided and used for managing the internal RADIUS clients configuration (`40_clients-radius.radconf`). Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.
## Policies

Policy configuration in `50_policies.radconf`:

* ACCOUNTING policy for logging all accounting
* PAP policy for PAP only authentication
* EAP policy for EAP only authentication, contains example of VLAN assignment
* DEFAULT policy for catching requests, which do not match other policies
* Policies have examples of conditions, which are checked to see what policy is a matching one. Only the first matching policy is processed when a match is found.

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

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
