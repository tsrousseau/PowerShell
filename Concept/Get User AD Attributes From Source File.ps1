Import-Module ActiveDirectory
$UserAttributesList = @()

# Iterate over list to get ad user attributes filter by employee id and store result
Import-CSV C:\Temp\ADUsers.csv | ForEach-Object { 
Get-ADUser  -Filter "username -eq $($_.username)" -Properties SamAccountName, Name, Mail| Select-Object samaccountname, name, mail
}

$UserAttributesList | Export-csv "C:\Temp\Get User AD Attributes From Source File.csv" -Append -NoTypeInformation