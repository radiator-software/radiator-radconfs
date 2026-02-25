# provision-mfa-secret.ps1
#
# Create a new client secret to Microsoft's Entra ID MFA Notification Client.
# This secret has to be updated to the Radiator configuration file 50_policies.radconf
# so that Radiator is allowed to use the MFA notification service.
#

Connect-MgGraph -Scopes 'Application.ReadWrite.All'
# Get ID of 'Entra Id MFA Notification Client' Service Principal
$servicePrincipalId = (Get-MgServicePrincipal -Filter "appid eq '981f26a1-7f43-403b-a875-f8b09b8cd720'").Id

$params = @{
	passwordCredential = @{
		displayName = "Radiator 10 MFA"
	}
}

# Create client secret and print it to user
$secret = Add-MgServicePrincipalPassword -ServicePrincipalId $servicePrincipalId -BodyParameter $params
Write-Output $secret
