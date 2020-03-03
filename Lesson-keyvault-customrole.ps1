connect-azAccount

$keyvault=Get-AzKeyVault -VaultName "cmk-key-vault-2557" -ResourceGroupName "cmk-key-vault-2557"

Get-AzRoleDefinition | Where-Object {$_.IsCustom -eq $true} | Format-Table Name , IsCustom

$subId=(Get-AzContext).Subscription.Id

$roleInfo = Get-Content .\Keyvault-custom-role.json

$roleInfo -replace "SUBSCRIPTION_ID", $subId > Keyvault-custom-role.json

$role = New-AzRoleDefinition -InputFile .\Keyvault-custom-role.json

$user = Get-AzADUser -DisplayName "parisamoosavinezhad"

$assignmentInfof = @{
    ObjectId = $user.Id
    Scope = $keyvault.ResourceId
    RoledefinitionId = $role.Id
}

New-AzRoleAssignment @assignmentInfof

Get-AzRoleAssignment -Scope $keyvault.ResourceId

