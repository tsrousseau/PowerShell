Import-Module ActiveDirectory
Clear-Host

$Date = Get-Date -UFormat "%Y%m%d"

#Pull all Generic user accounts
$UserList = Get-ADUser -filter * -Properties * | Where-Object { $_.passwordNeverExpires -eq "true" } |
Select-Object SamAccountName, DisplayName, Description, Department, LastLogonDate, WhenCreated, Enabled

$UserFile = "C:\Temp\Results - NonExpiring - " + $Date + ".csv"
$UserList | Export-Csv -Path $UserFile -NoTypeInformation -Encoding UTF8