
# this is for installing az module
Install-Module -Name Az -AllowClobber -Scope CurrentUser


# this is for removing azuretm module
foreach ($module in (Get-Module -ListAvailable AzureRM*).Name |Get-Unique) {
   write-host "Removing Module $module"
   Uninstall-module $module
}