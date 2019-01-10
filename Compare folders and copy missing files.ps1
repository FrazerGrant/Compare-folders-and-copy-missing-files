$foldertemp='C:\folder1'
$folderarchive ='C:\folder2'
$dest = 'C:\folder3'

$filetemp = Get-ChildItem $foldertemp -File | where { $_.LastWriteTime.ToString('yyyyMMdd') -ge '20180611'} 
$filearchive = Get-ChildItem $folderarchive -File | where { $_.LastWriteTime.ToString('yyyyMMdd') -ge '20180611'}
 
$missing= compare $filetemp $filearchive | where {$_.sideIndicator -eq "<="}

write-host $missing.inputobject.fullname.count " Missing files from " $dest

foreach ($file in $missing){
   # $file.inputobject.fullname}
    Write-host "Copying " $file.inputobject.fullname " to " $dest
    Copy-Item $file.inputobject.fullname -destination $dest}



# A shorter Powershell way, needs amending for this code.  Compare-Object $Folder1 $Folder2 -Property Name, Length  | Where-Object {$_.SideIndicator -eq "<="} | ForEach-Object {Copy-Item "C:\Folder1\$($_.name)" -Destination "C:\Folder3" -Force





