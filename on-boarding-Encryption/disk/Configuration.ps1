#----------------------------------
# Connect to Azure
#----------------------------------

# loging into azure
Connect-AzAccount

# for using specific environment
Connect-AzAccount -Environment (Get-AzEnvironment -Name AzureUSGovernment)

# if have multiple subscription, then get the list of them
Get-AzSubscription

# set azure context
Set-AzContext -SubscriptionId 58c373f2-afe4-4904-a3b3-9f99baf8c30b


#----------------------------------
# create a resource group
#----------------------------------
$ResourceGroupName="myKeyVaultResourceGroup"
$ResourceLocation="West Europe"
$rg=New-AzResourceGroup -Name $ResourceGroupName  -Location $ResourceLocation

#----------------------------------
# create a keyvault 
#----------------------------------
# key vault must have "enable soft delete" and "resource lock"
$kv=New-AzKeyVault -ResourceGroupName $ResourceGroupName -Name "mySecureVault" -Location $ResourceLocation

# vault name, resource group name, resource id , vault URI, and object id is needed for later

#----------------------------------
# set keyvault advanced policy
#----------------------------------
# Enable key vault for disk encryption
Set-AzKeyVaultAccessPolicy -VaultName $kv.VaultName -ResourceGroupName $kv.ResourceGroupName -EnabledForDiskEncryption

# Enable keyvault for deployment e.g. for the time the vm is being created
Set-AzKeyVaultAccessPolicy -VaultName $kv.VaultName -ResourceGroupName $kv.ResourceGroupName -EnabledForDeployment


# Enable keyvault for template deployment
Set-AzKeyVaultAccessPolicy -VaultName $kv.VaultName -ResourceGroupName $kv.ResourceGroupName -EnabledForTemplateDeployment

# these policies can be configured on azure portal as well -> keyvault-> access policies -> show advanced access policies -> enable the policies

#----------------------------------
# set up a key encryption key (KEK)
#----------------------------------
# KEK is for additional security layer
# KEK can be imported from on-prem key management HSM

$KeyEncrytionKeyName="mykeyencryptionkey"
$kek=Add-AzKeyVaultKey -VaultName $kv.VaultName -Name $KeyEncrytionKeyName -Destination 'HSM'

#----------------------------------
# Encrypt key
#----------------------------------
$vmName=""
Set-AzVMDiskEncryptionExtension -ResourceGroupName $ResourceGroupName -VMName $vmName -DiskEncryptionKeyVaultUrl $kv.VaultUri -DiskEncryptionKeyVaultId $kv.ResourceId -KeyEncryptionKeyUrl $kek.key.Kid -KeyEncryptionKeyVaultId $kv.ResourceId


