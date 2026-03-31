# TACACS+ with LDAP backend configuration for the Radiator 10

All file/path references in this document assume that the Radiator 10
package has been installed and this configuration is used as the
default configuration.

## Features
* TACACS+ authentication against LDAP backend.
* TACACS+ command authorizing with group(s) from LDAP.
* TACACS+ command accounting.

## Details
* LDAP backend configuration in    /var/lib/radiator/30_backends-ldap.radconf
* TACACS+ clients configuration in /var/lib/radiator/40_clients-tacacsplus.radconf (editable with template)
* TACACS+ server configuration in  /var/lib/radiator/40_servers-tacacsplus.radconf
* AAA policy configuration in      /var/lib/radiator/50_policies-tacacsplus.radconf
* TACACS+ authorization rules configuration in
  /var/lib/radiator/50_tacacs-authorization-rules.radconf (editable with template)
* Logging configuration and logging templates in 15_logging and 15_templates-logging respectively

## Server and clients
* TACACS+ server listens to port 49/TCP on all IP addresses
* Accepts connections from all IPs with default example password.
* Change these as needed to more restricted definitions.

Change LDAP configuration to match your database:

* url "ldap://<ldap_server_address>:389/";
* dn "cn=manager,dc=example,dc=com";
* password "<manager_password>";
* configure possible TLS
* in search "find_user": base, scope, filter and mappings
* in search "user_groups": base, scope, filter and mapping


## TACACS+ authorization rules
* defined in 50_policies-tacacsplus.radconf and 50_tacacs-authorization-rules.radconf
* cache "groups" timeout 1800s defines authorization timeout after successful authentication
* authorization block in handler "tacacs_authorization" is used to define TACACS+ authorization rules
* map user.group matches against user's group data fetched from LDAP
* incoming tacacsplus.request.args are matched against rules (comparison can be literal or regex)
* other comparisons also possible, for example tacacsplus.client or tacacsplus.client.ip
* tacacsplus.reply.args is used to convey possible TACACS+ reply attributes
* result can be accept or reject
* configuration includes debug clauses to visualize the AAA flow, can be removed


## Management UI
This example has Radiator 10 GUI activated:
  - Management UI is open to all IP addresses, protected by username and password and management certificates, configured in `/var/lib/radiator/management/`
  - Use https://YOUR-IP-ADDRESS:8443/ to access
  - Default username: _admin_ and password: _ChangeThisPassword!_

Example LDAP content

```ldap
# extended LDIF
#
# LDAPv3
# base <dc=example,dc=com> with scope subtree
# filter: (objectclass=*)
# requesting: ALL
#

# example.com
dn: dc=example,dc=com
objectClass: top
objectClass: dcObject
objectClass: organization
o: Example Organization
dc: example
description: Root LDAP entry for example.com

# People, example.com
dn: ou=People,dc=example,dc=com
objectClass: organizationalUnit
ou: People

# Groups, example.com
dn: ou=Groups,dc=example,dc=com
objectClass: organizationalUnit
ou: Groups

# users, Groups, example.com
dn: cn=users,ou=Groups,dc=example,dc=com
objectClass: posixGroup
cn: users
gidNumber: 5000
memberUid: mikem

# mikem, People, example.com
dn: uid=mikem,ou=People,dc=example,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: mikem
cn: mikem
sn: McCauley
givenName: Mike
displayName: Mike McCauley
uidNumber: 10000
gidNumber: 5000
gecos: Mike McCauley
loginShell: /bin/bash
homeDirectory: /home/mikem
# userPassword is "fred"
userPassword:: ZnJlZA==

# tacacs-rw, Groups, example.com
dn: cn=tacacs-rw,ou=Groups,dc=example,dc=com
objectClass: posixGroup
cn: tacacs-rw
gidNumber: 5001
memberUid: mikem

# search result
search: 2
result: 0 Success

# numResponses: 7
# numEntries: 6
```
