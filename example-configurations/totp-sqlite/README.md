# TOTP + PAP with SQLite backend example configuration for Radiator 10
All file/path references in this document assume that the Radiator 10
package has been installed and this configuration is used as the
default configuration.

## Summary
 * Authenticates users with PAP and TOTP.
 * The TOTP code is given at the end of the password, for example username: mikem password:fred123456
 * If user has totp_enabled set to 0 (false), the user is only authenticated with PAP.
 * User data is stored in an SQLite database.
 * Implements TOTP replay protection by tracking the last used timestep.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Internal Users

Internal users (e.g. the users authenticated locally by server for Wi-Fi access) are stored in an SQLite database:

* The database is located at `db/users-internal/users-internal-totp.sqlite`
* Database schema includes fields for username, password, TOTP enabled flag, TOTP seed, and last used timestep for replay protection
* To recreate the database, run: `sqlite3 db/users-internal/users-internal-totp.sqlite < db/users-internal/sqlite_users_internal_totp.sql`
* Initial usernames, passwords and TOTP seeds in the file:

|  Username | Password | TOTP Enabled | TOTP seed for authenticator |
|---|---|---|---|
| mikem | fred | Yes | 0000000000000000000000000000000000000000 |
| batman | TheHeroGothamDeserves | Yes | A0B1C2D3E4F5A6B7C8D9E0F1A2B3C4D5E6F7A8B9 |
| alfred | TheButlerDidIt | Yes | BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB |
| robin | HolyPasswordBatman | Yes | 8806804dd18806804dd18806804dd18806804dd1 |

## Database Management

You can add, modify, or remove users directly in the SQLite database:

```sql
-- Add a new user with TOTP
INSERT INTO users (username, password, totp_enabled, totp_seed, description, status)
VALUES('newuser', 'newpassword', 1, 'YOUR_TOTP_SEED_HERE', 'New User', 'active');

-- Update a user's password
UPDATE users SET password = 'newpassword' WHERE username = 'mikem';

-- Disable TOTP for a user
UPDATE users SET totp_enabled = 0 WHERE username = 'mikem';

-- Enable TOTP for a user
UPDATE users SET totp_enabled = 1, totp_seed = 'YOUR_TOTP_SEED_HERE' WHERE username = 'mikem';

-- Deactivate a user
UPDATE users SET status = 'inactive' WHERE username = 'mikem';
```

## TOTP Replay Protection

This configuration implements TOTP replay protection by tracking the last used timestep in the database:

* The `totp_last_timestep` field stores the timestep of the most recent successful authentication
* After each successful TOTP authentication, the timestep is updated in the database
* If a TOTP code from the same timestep is reused, authentication will fail with "Old TOTP replayed" error
* This prevents replay attacks where an attacker tries to reuse a captured TOTP code
* The field is initially NULL and is set after the first successful authentication

**Note:** Replay protection only applies when `totp_enabled = 1`. Users with TOTP disabled are authenticated with PAP only.

## Management UI
This example has Radiator 10 GUI activated:
 * Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: _admin_ and password: _ChangeThisPassword!_
