# Diameter and RADIUS accounting

Collect and log accounting through normal Radiator Policy Server and Radiator Core policies and handlers.
This example includes local collection and optional R4 bridge paths.

The access device generates START, INTERIM and STOP records. Authentication alone
does not generate them. Configure the device's accounting destination and interim
interval. Radiator Policy Server and Radiator Core translate incoming records
when a bridge is selected.

## Listeners and peers

| Endpoint | Purpose |
| --- | --- |
| UDP `127.0.0.1:18181` | RADIUS accounting ingress: local collection or forwarding to R4 |
| UDP `127.0.0.1:18183` | Final RADIUS collector used by the bridge examples |
| TCP `127.0.0.1:28681` | Incoming Diameter accounting from `r4-origin.example` |
| TCP `127.0.0.1:28682` | Outgoing Diameter peer `r4-collector.example` |

Both Diameter endpoints use explicit unprotected TCP compatibility. Change the
addresses, identities, realm, client secret and transport settings to match your
peers. The example advertises accounting applications 1 and 3.

## Send a sample session

Load the `.radconf` files alongside your normal license, dictionary and management
configuration. Install `radiator-client` and make it available in `PATH`.

```sh
./send-accounting.sh 127.0.0.1:18181 demo-local-001
```

The script acts as a NAS and sends three RADIUS Accounting-Requests immediately.
It requires an authenticated Accounting-Response for each request. The duration
and cumulative counters are sample data: 0 seconds at START, 60 seconds at INTERIM
and 120 seconds at STOP. The script does not wait for those intervals.

Reuse the same session ID within one lifecycle and choose a new ID for a new
session. The local example secret is `mysecret`; override it with the
`RADIATOR_RADIUS_SECRET` environment variable when the client configuration uses
a different secret.

## Logs

- `/var/log/radiator/diameter-accounting.log` contains native Diameter peer,
  application, Session-Id, record type/number, usage, Class and final policy result.
- `/var/log/radiator/radius-accounting.log` contains RADIUS NAS/session identity,
  status, duration, low/high counter words, Class and final policy result.

Diameter request fields are captured before the backend call because request
ownership is consumed before the final handler pipeline runs. The final log uses
that snapshot and the final outcome. Counter and record values are strings to
preserve exact integer values. `acct_session_id_hex` preserves the Diameter
OctetString; `class_hex` preserves repeated opaque Class values.

RADIUS logs use `start`, `alive` and `stop`; `alive` means INTERIM. Diameter logs
use record types `2`, `3` and `4`. Each bridge hop can produce its own log row.
Use the `policy` field to distinguish RADIUS ingress from final collection.

## Live R4 paths

R4 4.30-12 fixes Gigawords conversion in both directions. Its accounting gateway
still omits record numbers and standalone session identity and discards opaque
Class values. The R4-originated path requires the accounting identity candidate
patch; its successful result does not establish stock R4 gateway compatibility.

Start the R4 collector with its normal dictionary and these peer settings:

```sh
radiusd -foreground -log_stdout -log_dir . -config r4/collector.cfg
```

Send through R10 to R4 using either accounting profile. R4 converts the Diameter
request to RADIUS and forwards it back to the final collector on port 18183.

```sh
./send-accounting.sh 127.0.0.1:18181 demo-nasreq-001 to_r4_nasreq
./send-accounting.sh 127.0.0.1:18181 demo-base-001 to_r4_base
```

For the opposite direction, start the R4 gateway, wait for Diameter capability
exchange to complete, then send the same NAS lifecycle to its RADIUS listener:

```sh
radiusd -foreground -log_stdout -log_dir . -config r4/origin.cfg
./send-accounting.sh 127.0.0.1:18182 demo-r4-origin-001 from_r4
```

R4's gateway originates base accounting application 3. Radiator Policy Server
and Radiator Core translate it to the final RADIUS collector. R4's collector
accepts both configured accounting applications. STOP accounting here does not
request an additional STR; authorization-session termination requires correlated
authorization state.
