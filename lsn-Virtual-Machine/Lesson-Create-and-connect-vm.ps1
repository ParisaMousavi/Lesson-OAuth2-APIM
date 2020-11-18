
$ResourceGroupName="test"

New-AzResourceGroup `
   -ResourceGroupName $ResourceGroupName `
   -Location "EastUS"

$cred = Get-Credential

New-AzVm `
    -ResourceGroupName $ResourceGroupName `
    -Name "myVM" `
    -Location "EastUS" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -Credential $cred

    Get-AzPublicIpAddress `
    -ResourceGroupName $ResourceGroupName  | Select IpAddress

    mstsc /v:<publicIpAddress>
    