# Radiator UI with failed login limits

This example shows how to configure limits on failed Radiator UI and management API logins. After too many failed password logins, further logins are rejected for a while, even with the correct password. This slows down password guessing against the Radiator UI and management API.

NOTE: Select "Management configuration (management/)" checkbox when importing.

## Login limits

The limits are configured in `management/25_management-policy.radconf`:

| Limit                  | Default | Configured in                                                                   |
| ---------------------- | ------- | ------------------------------------------------------------------------------- |
| Failures per username  | 5       | `vars.login_limit_user_failures` in the `MGMT_LOGIN_LIMITS` pipeline            |
| Failures per source IP | 20      | `vars.login_limit_ip_failures` in the `MGMT_LOGIN_LIMITS` pipeline              |
| Lockout duration       | 15 min  | `timeout` of the `MGMT_LOGIN_FAILURES_USER` and `MGMT_LOGIN_FAILURES_IP` caches |

Set a limit to `0` to disable that lockout.

The lockout duration starts at the first counted login attempt and is not extended by later attempts, including attempts rejected because of an active lockout. For the source IP counter this can be an earlier successful login, because a successful login only undoes its own count and does not restart the period. The password is not checked during a lockout. Each attempt is counted before the password is checked, so the limits also hold when many login requests are sent in parallel. A successful login clears the username counter, but not the source IP counter. This prevents an attacker who has one valid account from resetting the limit while guessing passwords for other accounts.

Only logins with a username and password are limited. This includes the Radiator UI login and management API calls that use HTTP Basic authentication. Requests that use an existing Radiator UI session are not limited, so users who are already logged in can continue working during a lockout.

Every password login attempt is written to the authentication log with the username, source IP address, result and reason. Lockouts are logged with the reason `Too many failed logins for username` or `Too many failed logins from source IP address`.

### Considerations

* Anyone who can reach the Radiator UI can lock out a username by entering wrong passwords for it. Restrict access to the UI in `management/20_management-access.radconf` and with a firewall. If a username lockout causes problems, set the username limit to `0` and rely on the source IP limit.
* Several administrators behind the same NAT or proxy share a source IP address. Keep the source IP limit high enough for them.
* Counters are kept in memory. They are cleared when Radiator Policy Server and Radiator Core restart. In a cluster, each node counts failures independently.
* To end a lockout before it expires, restart Radiator Policy Server and Radiator Core.
* With the default limits, a patient attacker can still try 5 passwords per username every 15 minutes, about 480 per day. To slow this down further, add an escalating lockout: count lockouts per username in another cache with a longer timeout, such as 24 hours, and reject the username for that period after several lockouts. See the [rate limiting article](https://docs.radiatorsoftware.com/latest/docs/articles/rate-limiting/) for the counter pattern.

## Radiator UI
This example has Radiator UI activated:
 * Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
