# Radiator Example Configurations

This repository contains example configurations for [Radiator Policy Server](https://www.radiatorsoftware.com/products/radiator-policy-server) and [Radiator Core](https://radiatorsoftware.com/products/radiator-core). These configurations demonstrate common deployment scenarios and can be imported directly into a new Radiator instance from the UI configuration import. For best results, use these examples with the latest available release. Earlier releases may not support all functionality.

Utilizing these example configurations requires testing access to Radiator Policy Server or Radiator Core. To acquire testing access, please visit [our evaluation page](https://radiatorsoftware.com/evaluation) or contact sales@radiatorsoftware.com

## Importing Configurations

Example configurations are provided as `.zip` archives in the [`importable-zips`](importable-zips/) directory. These can be imported into a Radiator instance using the configuration import feature in the user interface.
For detailed instructions on importing and exporting configurations, see the [Configuration Import & Export documentation](https://docs.radiatorsoftware.com/latest/docs/articles/configuration-import-export/).

## Browsing Configurations

Unzipped versions of all example configurations are available in the [`example-configurations`](example-configurations/) directory for convenient browsing and review without needing to extract the zip archives. Each configuration directory includes a README that describes the use case in more detail.

## Example Configurations

### AD Authentication (`ad`)

AD authentication with optional group check included.

- Importable package: [`ad.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/ad.zip)
- Configuration files and README: [`example-configurations/ad`](example-configurations/ad/)

### Default minimal configuration (`default`)

Minimal configuration for clearing the existing configuration for easy start over. Contains Radiator UI access.

- Importable package: [`default.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/default.zip)
- Configuration files and README: [`example-configurations/default`](example-configurations/default/)

### Diameter and RADIUS Accounting (`diameter-accounting`)

Local accounting collection, structured final-outcome logs, a runnable
START/INTERIM/STOP sender and R4 bridge peer configurations for applications 1 and 3.
The R4 paths require the accounting fixes described in the example.

- Importable package: [`diameter-accounting.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/diameter-accounting.zip)
- Configuration files and README: [`example-configurations/diameter-accounting`](example-configurations/diameter-accounting/)

### EAP-TEAP with Windows user and machine authentication (`eap-teap-windows`)

EAP-TEAP authentication for Windows with inner EAP-TLS machine authentication and EAP-MSCHAPv2 user authentication.

- Importable package: [`eap-teap-windows.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/eap-teap-windows.zip)
- Configuration files and README: [`example-configurations/eap-teap-windows`](example-configurations/eap-teap-windows/)

### EAP-TLS with Microsoft Entra ID Authorisation (`eap-tls-entra-authz`)

Demonstrates EAP-TLS certificate-based authentication with Microsoft Entra ID as the authorisation backend. Policies check user group membership in Entra ID to authorise access.

- Importable package: [`eap-tls-entra-authz.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/eap-tls-entra-authz.zip)
- Configuration files and README: [`example-configurations/eap-tls-entra-authz`](example-configurations/eap-tls-entra-authz/)

### Minimal EAP-TLS (`eap-tls-minimal`)

A minimal EAP-TLS configuration for getting started with certificate-based RADIUS authentication. Uses demo certificates that are automatically available after installation.

- Importable package: [`eap-tls-minimal.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/eap-tls-minimal.zip)
- Configuration files and README: [`example-configurations/eap-tls-minimal`](example-configurations/eap-tls-minimal/)

### Microsoft Entra ID Authentication (`entra-ad`)

Configures Microsoft Entra ID as the authentication backend for RADIUS. Includes PAP authentication against Entra ID, with optional group check included.

- Importable package: [`entra-ad.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/entra-ad.zip)
- Configuration files and README: [`example-configurations/entra-ad`](example-configurations/entra-ad/)

### Microsoft Entra ID Authentication with MFA (`entra-auth-mfa`)

Extends Entra ID authentication with explicit multi-factor authentication. After successful username and password authentication via PAP, the MFA flow is triggered through Microsoft Entra ID.

- Importable package: [`entra-auth-mfa.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/entra-auth-mfa.zip)
- Configuration files and README: [`example-configurations/entra-auth-mfa`](example-configurations/entra-auth-mfa/)

### Microsoft Entra ID EAP-TTLS and EAP-TLS with Authorisation (`entra-id-ttls-tls-authz`)

Combines Microsoft Entra ID authentication and authorisation for both EAP-TTLS (username/password) and EAP-TLS (client certificate) methods. Entra ID is used as the authorisation backend for both authentication types.

- Importable package: [`entra-id-ttls-tls-authz.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/entra-id-ttls-tls-authz.zip)
- Configuration files and README: [`example-configurations/entra-id-ttls-tls-authz`](example-configurations/entra-id-ttls-tls-authz/)

### Fixed Line — FTTP, xDSL (`fixed-line`)

Configuration for fixed-line broadband scenarios such as FTTP and xDSL. Uses SQL as the backend for subscriber data and returns attributes from the database. Includes an example SQL schema.

- Importable package: [`fixed-line.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/fixed-line.zip)
- Configuration files and README: [`example-configurations/fixed-line`](example-configurations/fixed-line/)

### LDAP Authentication with RadSec Proxy (`ldap-auth-radsec-proxy`)

Authenticates local users against an LDAP backend while proxying requests for other realms via RadSec (e.g., to eduroam). Combines local LDAP authorisation with federated proxy functionality.

- Importable package: [`ldap-auth-radsec-proxy.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/ldap-auth-radsec-proxy.zip)
- Configuration files and README: [`example-configurations/ldap-auth-radsec-proxy`](example-configurations/ldap-auth-radsec-proxy/)

### Radiator UI with Microsoft Entra ID (`mgmt-entra`)

Radiator UI authentication from Microsoft Entra ID with fallback option to local JSON file.

- Importable package: [`mgmt-entra.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/mgmt-entra.zip)
- Configuration files and README: [`example-configurations/mgmt-entra`](example-configurations/mgmt-entra/)

### Radiator UI with LDAP (`mgmt-ldap`)

Radiator UI authentication from LDAP with fallback option to local JSON file.

- Importable package: [`mgmt-ldap.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/mgmt-ldap.zip)
- Configuration files and README: [`example-configurations/mgmt-ldap`](example-configurations/mgmt-ldap/)

### Radiator UI single sign-on with OpenID Connect (`mgmt-oidc`)

Radiator UI single sign-on with Microsoft Entra ID or Keycloak, with roles and groups mapped to privileges and a fallback option to local JSON file.

- Importable package: [`mgmt-oidc.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/mgmt-oidc.zip)
- Configuration files and README: [`example-configurations/mgmt-oidc`](example-configurations/mgmt-oidc/)

### Radiator UI with failed login limits (`mgmt-login-limits`)

Configuration that rejects Radiator UI and management API logins for a while after too many failed attempts per username or source IP address.

- Importable package: [`mgmt-login-limits.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/mgmt-login-limits.zip)
- Configuration files and README: [`example-configurations/mgmt-login-limits`](example-configurations/mgmt-login-limits/)

### Okta Authentication (`okta-ad`)

Configures Okta as the authentication backend for RADIUS. Includes PAP authentication against Okta, with optional group check included.

- Importable package: [`okta-ad.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/okta-ad.zip)
- Configuration files and README: [`example-configurations/okta-ad`](example-configurations/okta-ad/)

### Okta Authentication with Yubikey Cloud (`okta-yubikey-cloud`)

Configures Okta as the authentication backend for RADIUS with Yubikey Cloud OTP check. Does PAP authentication against Okta, Yubikey OTP against Yubico cloud and optional group check.

- Importable package: [`okta-yubikey-cloud.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/okta-yubikey-cloud.zip)
- Configuration files and README: [`example-configurations/okta-yubikey-cloud`](example-configurations/okta-yubikey-cloud/)

### Okta Authentication with Yubikey OTP (`okta-yubikey-otp`)

Configures Okta as the authentication backend for RADIUS with offline Yubikey OTP check from SQLite database. Does PAP authentication against Okta, Yubikey OTP against local database and optional group check.

- Importable package: [`okta-yubikey-otp.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/okta-yubikey-otp.zip)
- Configuration files and README: [`example-configurations/okta-yubikey-otp`](example-configurations/okta-yubikey-otp/)

### Minimal PAP (`pap-minimal`)

A minimal PAP authentication configuration. Authenticates users from a JSON file backend — the simplest starting point for getting Radiator up and running.

- Importable package: [`pap-minimal.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/pap-minimal.zip)
- Configuration files and README: [`example-configurations/pap-minimal`](example-configurations/pap-minimal/)

### RadiatorDB with clients, subscribers and sessions collection (`radiatordb-session`)

RadiatorDB with clients in collection, pap authentication from subscribers collection and session data stored to sessions collection.

- Importable package: [`radiatordb-session.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/radiatordb-session.zip)
- Configuration files and README: [`example-configurations/radiatordb-session`](example-configurations/radiatordb-session/)

### RADIUS and RadSec Proxy with EAP-TLS (`radius-radsec-proxy-with-eap-tls`)

Demonstrates proxying RADIUS requests over both RADIUS/UDP and RadSec (RADIUS over TLS) to upstream servers, combined with local EAP-TLS authentication. Includes proxy handlers for different realms.

- Importable package: [`radius-radsec-proxy-with-eap-tls.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/radius-radsec-proxy-with-eap-tls.zip)
- Configuration files and README: [`example-configurations/radius-radsec-proxy-with-eap-tls`](example-configurations/radius-radsec-proxy-with-eap-tls/)

### TACACS+ AAA with Microsoft Entra ID password authentication and MFA (`tacacs-entra-auth`)

TACACS+ authentication, authorization, and accounting with Microsoft Entra ID password authentication and MFA.

- Importable package: [`tacacs-entra-auth.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/tacacs-entra-auth.zip)
- Configuration files and README: [`example-configurations/tacacs-entra-auth`](example-configurations/tacacs-entra-auth/)

### TACACS+ with LDAP Backend (`tacacs-ldap`)

Configures TACACS+ authentication, command authorisation, and accounting against an LDAP backend. Supports group-based command authorisation rules fetched from LDAP.

- Importable package: [`tacacs-ldap.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/tacacs-ldap.zip)
- Configuration files and README: [`example-configurations/tacacs-ldap`](example-configurations/tacacs-ldap/)

### TACACS+ with LDAP and Editor (`tacacs-ldap-template`)

Configures TACACS+ authentication, command authorisation, and accounting against an LDAP backend. Supports group-based command authorisation rules fetched from LDAP. Includes UI editing of TACACS+ clients and authorisation rules for easier day-to-day operations.

- Importable package: [`tacacs-ldap-template.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/tacacs-ldap-template.zip)
- Configuration files and README: [`example-configurations/tacacs-ldap-template`](example-configurations/tacacs-ldap-template/)

### TOTP + PAP with JSON File Backend (`totp-jsonfile`)

Authenticates users with PAP combined with TOTP (Time-based One-Time Password). User credentials and TOTP seeds are stored in a JSON5 file managed via the user interface. TOTP can be enabled or disabled per user.

- Importable package: [`totp-jsonfile.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/totp-jsonfile.zip)
- Configuration files and README: [`example-configurations/totp-jsonfile`](example-configurations/totp-jsonfile/)

### TOTP + PAP with SQLite Backend (`totp-sqlite`)

Authenticates users with PAP combined with TOTP using an SQLite database backend. Includes TOTP replay protection by tracking the last used timestep. User management is done directly via SQL.

- Importable package: [`totp-sqlite.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/totp-sqlite.zip)
- Configuration files and README: [`example-configurations/totp-sqlite`](example-configurations/totp-sqlite/)

### Enterprise Wi-Fi EAP Server (`wifi-eap-server`)

A comprehensive enterprise Wi-Fi (802.1X/WPA Enterprise) configuration supporting EAP-TLS, EAP-TTLS and EAP-PEAP authentication methods (see `eap-teap-windows` for EAP-TEAP). Includes both RADIUS and RadSec server support, VLAN assignment examples, and a JSON file backend for user management.

- Importable package: [`wifi-eap-server.zip`](https://raw.githubusercontent.com/radiator-software/radiator-radconfs/main/importable-zips/wifi-eap-server.zip)
- Configuration files and README: [`example-configurations/wifi-eap-server`](example-configurations/wifi-eap-server/)
