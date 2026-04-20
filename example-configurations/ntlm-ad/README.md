# Authentication against Active Directory with NTLM

This example shows how Radiator running on a Linux or Unix system can authenticate to a Windows domain controller, with the assistance of utilities from the Samba suite (www.samba.org).

Using this configuration requires that `ntlm_auth` and `winbindd`, both part of Samba, are installed and configured correctly. It is vitally important that you confirm that `ntlm_auth` is working properly before trying to use this example.

You can test ntlm_auth like this from the command line:
```
ntlm_auth --username=yourusername --password=yourpassword
```

If that does not work for a valid username and password, there is no way that this configuration would work. Make sure ntlm_auth works first.

## Configuring ntlm_auth, winbindd and domain join

### winbindd

For ntlm_auth to work, winbindd is required, which means Samba must be installed on the Radiator host. Samba is available on all major Unix and Linux distributions, as well as from [Samba webpage](https://www.samba.org).

Below is a minimal sample Samba configuration _/etc/samba/smb.conf_ for winbindd:
```
[global]
   workgroup = DEV
   realm = dev.example.com
   security = ads
```

This allows ntlm_auth running on the Radiator host on a Unix or Linux to authenticate to a Windows domain controller.

Although winbindd is part of Samba, on some Linux distributions winbindd may be included in a separate RPM or deb, for example _samba-winbind_ on
RHEL and _winbind_ on Ubuntu.

### Domain join

You must also enroll your Linux/Unix host to the Windows domain by running the `net` command (also part of Samba) on the Unix host:
```
% sudo net ads join -S ws2022-ad-dc.dev.example.com -U administrator
```
Parameter -S is followed by the hostname of your domain controller and -U by the Windows user name of a suitably privileged Windows user. The password of this user is prompted when running the command. This command allows winbindd to contact the domain controller to do authentication any time afterwards.

Once successful there is information like _Joined 'UBUNTU-2404' to dns domain 'dev.example.com'_.

NOTE: For the 'net ads join ...' command to succeed, your DNS must be able to resolve the domain controller name. This means either _/etc/hosts_ file or DNS should have an entry for both the hostname and fully qualified DNS name (FQDN).

When the 'net ads join ...' command succeeds, winbind service must be restarted. You can then test NTLM authentication again from the command line:
```
 % systemctl restart winbind
 % ntlm_auth --username=mikem --password=fred
 NT_STATUS_OK: The operation completed successfully. (0x0)
```

## Radiator and winbindd socket

Radiator must be able to access the privileged winbindd socket. This can be easily done with systemd:
```
systemctl edit radiator-server.service
```

Add the 'SupplementaryGroups' definition in Service section. For example on Ubuntu:
```
[Service]

# AuthBy NTLM requires access to winbindd socket. This is often
# possible with group access, such as wbpriv on RHEL/CentOS and
# winbindd_priv on Debian and Ubuntu.
SupplementaryGroups=winbindd_priv
```

This will create a systemd override file, which means that your changes are not lost when Radiator is upgraded.

Consult the Samba, winbindd and ntlm_auth documentation for more details on e.g. configuration.


## Clients
In the Radiator configuration the RADIUS clients can be statically configured in `/var/lib/radiator/40_clients-radius.radconf` and used in `/var/lib/radiator/40_servers-radius.radconf`.
Adding and modifying RADIUS clients can be done with templates in the GUI by selecting 'Local clients' from the menu.


## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_
