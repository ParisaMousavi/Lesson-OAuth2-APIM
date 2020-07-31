# create resource group
New-AzResourceGroup -Name $resource_group_name -Location $location

# create subnets
$frontend_subnet = New-AzVirtualNetworkSubnetConfig -Name "myfrontendsubnet" -AddressPrefix 10.0.0.0/24

$backend_subnet = New-AzVirtualNetworkSubnetConfig -Name "mybackendsubnet" -AddressPrefix 10.0.1.0/24

# create virtual network
$vnet = New-AzVirtualNetwork -Name "mnyvnet"  -ResourceGroupName $resource_group_name -Location $location -addressprefix 10.0.0.0/16 -Subnet $frontend_subnet, $backend_subnet

# create public ip
$pip = New-AzPublicIpAddress -ResourceGroupName $resource_group_name -Name "mypip" -Location $location -allocatedMethod Dynamic 

# create frontend NIC
$frontend_nic = New-AzNetworkInterface -ResourceGroupName $resource_group_name -Name "frontendnic" -Location $location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id

# create frontend vm
$cred = Get-Credential
$frontend_vm = New-AzVm -ResourceGroupName $resource_group_name -Location $location -Name "frontndvm" -Credential $cred -Size Standard_D1 -SubnetName "myfrontendsubnet" -VirtualNetworkName "myvnet"




                            
