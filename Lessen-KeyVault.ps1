


$perfix="cmk"

#Basic variable
$location = "eastus"
$id = Get-Random -Minimum 1000 -maximum 9999

#Create a resource group for key vault
$keyVaultGroup = New-AzResourceGroup -Name $perfix"-key-vault-"$id -Location $location

#Create a new key vault with "splating" technique, which works with Hash Table.
$keyVaultParameters = @{
    Name = $perfix+"-key-vault-"+$id
    ResourceGroupName = $keyVaultGroup.ResourceGroupName
    Location = $location
    Sku = "Premium"
}

$keyVault = New-AzKeyVault @keyVaultParameters

#grant yourself access tot the key vault
#give your user principal access to all storage account permissions, on your key vault instance.
$accessPolicy = @{
    VaultName = $keyVault.VaultName
    UserPrincipalName = "USER_PRINCIPAL_NAME"
    PermissionToStorage = ("get", "list", "listsas", "delete", "set", "update","regeneratekey","recover","backup")
}

Set-AzKeyVaultAccessPolicy $accessPolicy

$keyVault | Format-List

#create a new storage account
$saAccountParameter = @{
    Name = "$($perfix)sa$id"
    ResourceGroupName = $keyVaultGroup.ResourceGroupName
    Location = $location
    skuName = "Standard_LRS"
}

$storageAccount = New-AzStorageAccount @saAccountParameter

Get-AzStorageAccountKey -ResourceGroupName $storageAccount.ResourceGroupName -Name $storageAccount.StorageAccountName1


$keyVaultSpAppId = ""


New-AzRoleAssignment -ApplicationId $keyVaultSpAppId -RoleDefinitionName "Storage Account Key Operation Service Role" -Scope $storageAccount.Id

# ass your storage account to your key vault's managed storage accounts
$managedStorageAccount= @{
    vaultName = $keyVault.VaultName
    AccountName = $storageAccount.StorageAccountName
    AccountResourceId= $storageAccount.Id
    ActiveKeyName="key1"
    RegenerationPeriod= [System.TimeSpan]::FromDays(90)
}

Add-AzKeyVaultManagedStorageAccount -VaultName $keyVault.VaultName 

Update-AzKeyVaultManagedStorageAccountKey -VaultName $keyVault.VaultName -AccountName $stora.StorageAccountName -ActiveKeyName "key1"


