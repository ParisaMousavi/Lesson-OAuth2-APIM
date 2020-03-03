#
# Script.ps1
#
function My-Function([parameter(position=0)][system.string]$path){
	:looplabel foreach($thisfile in (Get-ChildItem $path)){
		write-host(
			'length: ' + 
			$thisfile.basename +
			[System.Math]::Floor($thisfile.length/1000)
		)
	}
}

#1My-Function C:\agent
# Azure limitation RG 980 per subscription
function Create2001ResourceGroups(){
	for($i=1; $i -lt 2002; $i++)
	{
		$resourceGroupName="testlimitation"+$i
		write-host $resourceGroupName
		New-AzResourceGroup -Name $resourceGroupName -Location "West US"
	}
}


function Remove2001ResourceGroups(){
	for($i=1; $i -lt 980; $i++)
	{
		$resourceGroupName="testlimitation"+$i
		write-host $resourceGroupName
		Remove-AzResourceGroup -Name $resourceGroupName -Force
	}
}

