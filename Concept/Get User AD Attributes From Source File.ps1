Remove-Item "C:\Temp\Results - AD User from Source File.csv"
Clear-Host
Write-Host "Retrieving attributes from username input CSV file.  Please stand by..." -ForegroundColor Cyan

# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow

Import-Module ActiveDirectory

$userList = import-csv ".\Source - AD Users List.csv"
ForEach($User in $userList){
     Get-ADUser -Identity $user.SamAccountName -Properties * | Select-Object SamAccountName, userAccountControl, CN | Export-Csv -Append "C:\Temp\Results - AD User from Source File.csv" -NoTypeInformation
}

Write-Host "Results retrieved.  Process finished." -ForegroundColor Green

# Insert an end date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow