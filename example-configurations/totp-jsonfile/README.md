# TOTP + PAP with jsonfile backend example configuration for Radiator 10
All file/path references in this document assume that the Radiator 10
package has been installed and this configuration is used as the
default configuration.

## Summary
 * Authenticates users with PAP and TOTP.
 * The TOTP code is given at the end of the password, for example username: mikem password:fred123456
 * If user has totp_enabled "false", the user is only authenticated with PAP.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Internal Users

Internal users (e.g. the users authenticated locally by server for Wi-Fi access) are also managed by a radconf template (`users-internal.json5.radtmpl`):

* The users must be managed via user interface with the provided template; manual edits of JSON5 may cause problems with the UI integration
* The users are stored in a custom JSON5 file at `db/users-internal/users-internal-totp.json5`
* Initial usernames, passwords and TOTP seeds in the file:

|  Username | Password | TOTP seed for authenticator |
|---|---|---|
| mikem | fred | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
| batman | TheHeroGothamDeserves | UCY4FU7E6WTLPSGZ4DY2FM6E2XTPPKFZ |
| alfred | TheButlerDidIt | XO53XO53XO53XO53XO53XO53XO53XO53 |
| robin | HolyPasswordBatman | RADIATORRADIATORRADIATORRADIATORRADIATORRADIATOR |




## Management UI
This example has Radiator 10 GUI activated:
 * Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: _admin_ and password: _ChangeThisPassword!_
