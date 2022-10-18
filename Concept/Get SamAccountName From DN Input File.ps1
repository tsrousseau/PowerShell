Remove-Item "C:\Temp\Results - AD User from Source File.csv" -ErrorAction Ignore
Import-Module ActiveDirectory
Clear-Host

Write-Host "Warning: This can be a lengthy process." -ForegroundColor Red
Write-Host "Retrieving specified attributes for listed users.  Please stand by..." -ForegroundColor Cyan

# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow

$userList = import-csv ".\Source - Get SamAccountName from DN.csv"
ForEach($User in $userList)
{
    Write-Host "$user" -ForegroundColor Green
    Get-ADUser -Identity $user.distinguishedName -Properties * | Select-Object SamAccountName, Department, GivenName, Surname, DistinguishedName | Export-Csv -Append "C:\Temp\Results - AD User from Source File.csv" -NoTypeInformation
}

# Add date and time to exported file.
$filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and Only Specified Fields in Domain.csv"
Rename-Item "C:\Temp\Results - AD User from Source File.csv" -NewName $filenameFormat

Write-Host "Results retrieved.  Process finished." -ForegroundColor Green

# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow