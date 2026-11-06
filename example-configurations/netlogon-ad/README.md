# Authentication against Active Directory with Netlogon

The Netlogon backend is [experimental](https://docs.radiatorsoftware.com/latest/docs/articles/experimental-features/). Its configuration options, defaults, and log messages may change in a later release.

This example authenticates RADIUS PAP, MSCHAP and MSCHAPv2 users, and EAP-TTLS, EAP-PEAP and EAP-TEAP users with inner PAP, MSCHAPv2 or EAP-MSCHAPv2, against an Active Directory domain controller. Radiator uses the [`netlogon`](https://docs.radiatorsoftware.com/latest/docs/configuration/backends.netlogon/) backend, which talks to the domain controller directly. Samba, `winbindd` and `ntlm_auth` are not needed on the Radiator host.

## Prepare Active Directory

1. Create a computer account for this Radiator instance, such as `RADIATOR1`, and set a long random password for it. Each Radiator instance needs its own computer account.
2. Set a fixed Netlogon port on each domain controller with the `DCTcpipPort` value under `HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters`, and restart the Netlogon service.
3. Allow connections to that port from the Radiator host in the domain controller firewall.

The [Netlogon backend documentation](https://docs.radiatorsoftware.com/latest/docs/configuration/backends.netlogon/) describes the Active Directory settings that affect the backend, including NTLM restrictions and hardening.

## Configure Radiator

Edit `/var/lib/radiator/30_backends-netlogon.radconf`:

- `endpoint`: domain controller host name and the `DCTcpipPort` port.
- `domain_controller`: domain controller name, such as `\\DC1`.
- `computer_domain`: NetBIOS name of the domain.
- `computer_name` and `machine_account`: name of the computer account, without and with the trailing `$`.

The configuration reads the computer account password from the `NETLOGON_MACHINE_PASSWORD` environment variable. Set it with a systemd override:

```
systemctl edit radiator-server.service
```

```
[Service]
Environment=NETLOGON_MACHINE_PASSWORD=the-computer-account-password
```

When the domain restricts NTLM, `user@realm` identities must be sent as the plain account name and its domain. The commented `username` and `domain` settings in the backend do this, but only for `user@realm` identities: with them, a `DOMAIN\user` identity is sent as the account name `DOMAIN\user`, which the domain controller rejects. Uncomment them only when every user logs on with `user@realm`, or add a second backend with them and select it in the policies for identities that contain `@`.

## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in Radiator UI by selecting 'Local clients' from the menu.

## Radiator UI
This example has Radiator UI activated:
  - Radiator UI is available over HTTPS on all IPv4 addresses and protected by username and password, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
