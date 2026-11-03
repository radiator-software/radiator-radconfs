# Okta authentication for Radiator Policy Server and Radiator Core with Yubikey OTP

This configuration shows how to configure Okta as authentication backend both on the Radiator side and also the steps needed on the Okta side together with Yubikey OTP configuration.

Check out the _Okta Application Setup_ for more details. Radiator configuration can be updated with the Okta information from Radiator UI, see more in _Radiator Policy Server Okta configuration guide_

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
VALUES ('mikem2@example.com','vvccccriigjn',X'9fafa61d1ccafd37a33d7a3703356cd5',0,0);
```

## Testing

The configuration can be tested for example with:
```
/opt/radiator/server/bin/radiator-client --server 127.0.0.1 --secret mysecret --user <user@okta-domain.com> --password <password><YubikeyOTP>
```

## Clients

In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Configuration
Policy configuration in `50_policies.radconf`
  - DEFAULT policy with an AUTHENTICATION handler for Okta user and password authentication with Yubikey OTP checks
  - The first matching policy owns the request. If no handler matches within it, processing stops without trying another policy.

The Okta information is set in `25_pipeline-okta-credentials.radconf`
 - Fill your Okta domain, Authorization server ID, client ID and client secret here.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
