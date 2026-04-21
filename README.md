# Radiator Example Configurations

This repository contains example configurations for [Radiator Policy Server](https://www.radiatorsoftware.com/products/radiator-policy-server) and [Radiator Core](https://radiatorsoftware.com/products/radiator-core). These configurations demonstrate common deployment scenarios and can be imported directly into a new Radiator instance from the UI configuration import.

Utilizing these example configurations requires testing access to Radiator Policy Server or Radiator Core. To acquire testing access, please visit [our evaluation page](https://radiatorsoftware.com/evaluation) or contact sales@radiatorsoftware.com

## Importing Configurations

Example configurations are provided as `.zip` archieves. These can be imported into a Radiator instance using the configuration import feature in the user interface.
For detailed instructions on importing and exporting configurations, see the [Configuration Import & Export documentation](https://docs.radiatorsoftware.com/latest/docs/articles/configuration-import-export/).

## Browsing Configurations

Unzipped versions of all example configurations are available under the [`example-configurations/`](example-configurations/) directory for convenient browsing and review without needing to extract the zip archives.

## Example Configurations

### AD Authentication (`ad`)

AD authentication with optional group check included.

### Default minimal configuration (`default`)

Empty configuration for clearing the existing configuration for easy start over.

### EAP-TLS with Microsoft Entra ID Authorisation (`eap-tls-entra-authz`)

Demonstrates EAP-TLS certificate-based authentication with Microsoft Entra ID as the authorisation backend. Policies check user group membership in Entra ID to authorise access.

### Minimal EAP-TLS (`eap-tls-minimal`)

A minimal EAP-TLS configuration for getting started with certificate-based RADIUS authentication. Uses demo certificates that are automatically available after installation.

### Microsoft Entra ID Authentication (`entra-ad`)

Configures Microsoft Entra ID as the authentication backend for RADIUS. Includes PAP authentication against Entra ID, with optional group check included.

### Microsoft Entra ID Authentication with MFA (`entra-auth-mfa`)

Extends Entra ID authentication with explicit multi-factor authentication. After successful username and password authentication via PAP, the MFA flow is triggered through Microsoft Entra ID.

### Microsoft Entra ID EAP-TTLS and EAP-TLS with Authorisation (`entra-id-ttls-tls-authz`)

Combines Microsoft Entra ID authentication and authorisation for both EAP-TTLS (username/password) and EAP-TLS (client certificate) methods. Entra ID is used as the authorisation backend for both authentication types.

### Fixed Line — FTTP, xDSL (`fixed-line`)

Configuration for fixed-line broadband scenarios such as FTTP and xDSL. Uses SQL as the backend for subscriber data and returns attributes from the database. Includes an example SQL schema.

### LDAP Authentication with RadSec Proxy (`ldap-auth-radsec-proxy`)

Authenticates local users against an LDAP backend while proxying requests for other realms via RadSec (e.g., to eduroam). Combines local LDAP authorisation with federated proxy functionality.

### Management UI with LDAP (`mgmt-ldap`)

Management UI authentication from LDAP with fallback option to local JSON file.

### NTLM Authentication (`ntlm-ad`)

Configures NTLM with Active Directory as the authentication backend for RADIUS. Includes PAP and EAP authentication.

### Okta Authentication (`okta-ad`)

Configures Okta as the authentication backend for RADIUS. Includes PAP authentication against Okta, with optional group check included.

### Okta Authentication with Yubikey Cloud (`okta-yubikey-cloud`)

Configures Okta as the authentication backend for RADIUS with Yubikey Cloud OTP check. Does PAP authentication against Okta, Yubikey OTP against Yubico cloud and optional group check.

### Okta Authentication with Yubikey OPT (`okta-yubikey-otp`)

Configures Okta as the authentication backend for RADIUS with offline Yubikey OTP check from SQLite database. Does PAP authentication against Okta, Yubikey OTP against local database and optional group check.

### Minimal PAP (`pap-minimal`)

A minimal PAP authentication configuration. Authenticates users from a flat file backend — the simplest starting point for getting Radiator up and running.

### RADIUS and RadSec Proxy with EAP-TLS (`radius-radsec-proxy-with-eap-tls`)
Demonstrates proxying RADIUS requests over both RADIUS/UDP and RadSec (RADIUS over TLS) to upstream servers, combined with local EAP-TLS authentication. Includes proxy handlers for different realms.

### TACACS+ with LDAP Backend (`tacacs-ldap`)
Configures TACACS+ authentication, command authorisation, and accounting against an LDAP backend. Supports group-based command authorisation rules fetched from LDAP.

### TACACS+ with LDAP and Editor (`tacacs-ldap-template`)
Configures TACACS+ authentication, command authorisation, and accounting against an LDAP backend. Supports group-based command authorisation rules fetched from LDAP. Includes UI editing of TACACS+ clients and authorisation rules for easier day-to-day operations.

### TOTP + PAP with JSON File Backend (`totp-jsonfile`)
Authenticates users with PAP combined with TOTP (Time-based One-Time Password). User credentials and TOTP seeds are stored in a JSON5 file managed via the user interface. TOTP can be enabled or disabled per user.

### TOTP + PAP with SQLite Backend (`totp-sqlite`)
Authenticates users with PAP combined with TOTP using an SQLite database backend. Includes TOTP replay protection by tracking the last used timestep. User management is done directly via SQL.

### Enterprise Wi-Fi EAP Server (`wifi-eap-server`)
A comprehensive enterprise Wi-Fi (802.1X/WPA Enterprise) configuration supporting EAP-TLS, EAP-TTLS, EAP-PEAP and EAP-TEAP authentication methods. Includes both RADIUS and RadSec server support, VLAN assignment examples, and a JSON file backend for user management.
