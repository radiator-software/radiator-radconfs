# Okta authentication for the Radiator 10 with Yubikey OTP

This configuration shows how to configure Okta as authentication backend both on the Radiator side and also the steps needed on the Okta side together with Yubikey OTP configuration.

Check out the _Okta Application Setup_ for more details. Radiator configuration can be updated with the Okta information from the GUI, see more in _Radiator Policy Server Okta configuration guide_

This example uses offline Yubikey validation with SQLite database.

## Offline Yubikey validation

Needed Yubikey details are stored in an SQLite database:

* The database is located at `db/users-internal/yubikey.sqlite`
* Database schema includes fields for username, public_uid, aes_key, usage_counter and session_counter
* To recreate the database, edit the db/users-internal/sqlite-yubikey.sql file INSERT INTO statement to contain information of your Yubikey and then run: `sqlite3 db/users-internal/yubikey.sqlite < db/users-internal/sqlite-yubikey.sql`

## Database Management

You can add, modify, or remove users directly in the SQLite database:

```sql
-- Add a new Yubikey details
INSERT INTO yubikeys (username, public_uid, aes_key, usage_counter, session_counter)
VALUES ('mikem2@example.com','nbihgawwwjfph',X'9fafa61d1ccafd37a33d7a3703356cd5',0,0);
```

## Testing

The configuration can be tested for example with:
```
/opt/radiator/server/testutils/radiator-client --auth-port 1812 --acct-port 1813 --secret mysecret --user <user@okta-domain.com> --password <password><YubikeyOTP>
```

## Clients

In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - ACCOUNTING policy for logging all accounting
  - AUTHENTICATION policy for Okta user and password authentication with Yubikey OTP check
  - DEFAULT policy for catching requests, which do not match other handlers
  - Policies have example conditions, when checking the conditions the policy with first match is used

The Okta information is set in `25_pipeline-okta-credentials.radconf`
 - Fill your Okta domain, Authorization server ID, client ID and client secret here.

## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
