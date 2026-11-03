# TACACS+ AAA with Microsoft Entra ID password authentication and MFA

This Radiator Policy Server and Radiator Core example combines TACACS+ authentication, authorization, and
accounting with Microsoft Entra ID password authentication and MFA.

## Features

- TACACS+ ASCII username and password authentication against Microsoft Entra ID.
- Microsoft Entra MFA after successful password authentication.
- TACACS+ command authorization using the user's Microsoft Entra group memberships.
- TACACS+ command accounting.

## Microsoft Entra configuration

Follow the Microsoft Entra setup in the Microsoft-Entra-ID-App-creation-for-Radiator-authentication.pdf
guide. Configure the tenant ID, application client ID, application secret, and the secret produced
by `provision-mfa-secret.ps1` (included in the entra-auth-mfa example) in
`/var/lib/radiator/25_pipeline-entra-credentials.radconf`. These values can also
be edited with the **Entra details** form in the Radiator UI.

The application needs the Microsoft Graph permissions as described in the
Microsoft-Entra-ID-App-creation-for-Radiator-authentication.pdf. This example uses
the OAuth 2.0 Resource Owner Password Credentials flow.

## TACACS+ flow

The server listens on TCP port 49. Configure clients in
`/var/lib/radiator/40_clients-tacacsplus.radconf` and replace the example shared
secret.

For TACACS+ ASCII authentication, Radiator prompts for a username or password
when the device did not include it in the initial request. The captured password
is available as `tacacsplus.request.password` and is used only for the Entra
OAuth token request. After password authentication succeeds, Radiator checks
that the account is enabled, triggers MFA, fetches the user's Entra groups, and
caches those groups for 30 minutes.

Authorization requests do not contain the user's password and do not trigger
MFA again. They use the cached group memberships. Once the cache entry expires,
the user must authenticate again before command authorization succeeds.

Configure group-based command rules in
`/var/lib/radiator/50_tacacs-authorization-rules.radconf` or with the
**TACACS+ authorization rules** form in the Radiator UI. The initial example
contains no allow rules and therefore rejects every authorization request until
rules are added.

## Testing

Test with a TACACS+ client or network device that supports TACACS+ ASCII login.
Allow enough time for the user to approve the MFA request. Authentication must
complete before testing command authorization so the Entra groups are present
in the cache.

## Radiator UI

The Radiator UI listens on port 8443 and uses the files under
`/var/lib/radiator/management/`. The example credentials are username `admin`
and password `ChangeThisPassword!`; change them before deployment.

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
