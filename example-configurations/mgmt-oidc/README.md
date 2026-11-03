# Radiator UI single sign-on with OpenID Connect

This example lets users sign in to Radiator UI with Microsoft Entra ID or Keycloak through OpenID Connect. The login page shows a "Sign in with ..." button for each provider. The management policy maps the roles and groups in the ID token to Radiator UI privileges. Local users in `management/management-users.json5`, such as `admin`, keep signing in with a password, also when the identity providers are not reachable.

NOTE: Select "Management configuration (management/)" checkbox when importing.

## Microsoft Entra ID

1. Register a single-tenant web application in Microsoft Entra ID. Add the redirect URIs `https://YOUR-RADIATOR-ADDRESS:8443/api/v1/auth/oidc/entra/callback` and `https://YOUR-RADIATOR-ADDRESS:8443/ui/login`, which Entra returns the browser to after sign-out, and create a client secret.
2. Create the app roles `Radiator.Admin`, `Radiator.Operator` and `Radiator.Monitor` in the application and assign them to users or groups. Alternatively, add the groups claim in the token configuration and replace the example group object IDs in `management/25_management-policy.radconf`.
3. For users with many groups, Entra leaves the groups out of the ID token. The policy then reads them from Microsoft Graph, which needs the `GroupMember.Read.All` application permission with admin consent.
4. Fill in the tenant ID, application (client) ID, client secret, redirect URL and `logout_redirect` URL in `management/20_management.radconf` and `management/25_pipeline-entra-credentials.radconf`.

## Keycloak

1. Create an OpenID Connect client with client authentication enabled and the valid redirect URI `https://YOUR-RADIATOR-ADDRESS:8443/api/v1/auth/oidc/keycloak/callback`.
2. Create the realm roles `radiator-admin` and `radiator-monitor` and assign them to users. Enable "Add to ID token" in the realm roles mapper of the client's dedicated scope.
3. Fill in the issuer (`https://KEYCLOAK/realms/REALM`), client ID, client secret and redirect URL in `management/20_management.radconf`.

Remove the `oidc` block of a provider that you do not use. Radiator logs a warning after loading the configuration when it cannot read a provider's metadata.

## Radiator UI
This example has Radiator UI activated:
 * Radiator UI is available over HTTPS on all IPv4 addresses, configured in `/var/lib/radiator/management/`
 * Use https://YOUR-IP-ADDRESS:8443/ to access
 * Default username: `admin` and password: `ChangeThisPassword!`

## Compatibility

For best results, use this example with the latest available release. Earlier releases may not support all functionality.
