Clear-Host
# Insert a date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow -BackgroundColor Black

Import-Module ActiveDirectory

$userList = import-csv "C:\Temp\Source - AD Users List.csv"
ForEach($User in $userList){
     Get-ADUser -Identity $user.UserName -Properties * | Select-Object SamAccountName, Mail, CN, EmployeeID | Export-Csv -Append "C:\Temp\Results - AD User from Source File.csv" -NoTypeInformation
}

# Insert a date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Green -BackgroundColor Black