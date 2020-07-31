function Add-Num {
    param (
        [parameter(Position=0, Mandatory=$true, HelpMessage="Please int value only.", ValueFromPipeline=$true)] # this is an annotation for parameter $int1
        [Alias("value1","a")]
        [int]$int1, 
        [int]$int2, 
        [switch]$flag) # This is for input parameter
    if ($flag) {Write-Host "flag used"}
    Write-Host($int1+$int2)
    
}