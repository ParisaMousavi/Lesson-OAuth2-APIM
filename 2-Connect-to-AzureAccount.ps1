connect-azAccount

Get-AzSubscription -SubscriptionName "Visual Studio Enterprise – MPN" | Select-AzSubscription


# cretea a group in apim from B2C
$ctx = New-AzApiManagementContext -ServiceName "learn-apim-tekaris" -ResourceGroupName "Learn-APIM"

New-AzApiManagementGroup -Context $ctx  -Name "add-group-from-another-aad-b2c" -Type External -ExternalId  "aad://moosavib2c.onmicrosoft.com/groups/e00bcada-ee98-42e2-b8e0-5c5fd908b0fb"

