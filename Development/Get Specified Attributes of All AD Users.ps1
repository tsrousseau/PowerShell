Remove-Item "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -ErrorAction Ignore
Import-Module ActiveDirectory
Clear-Host

Write-Host "Warning: This can be a lengthy process." -ForegroundColor Red
Write-Host "Retrieving attributes for all users.  Please stand by..." -ForegroundColor Cyan

# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow

# Returns specified fields for all AD users in the domain.
Get-ADUser -Filter * -Properties SamAccountName, Department, Manager | Select-Object SamAccountName, Department, Manager | Export-Csv "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NoTypeInformation -Append

# Add date and time to exported file.
$filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and Only Specified Fields in Domain.csv"
Rename-Item "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NewName $filenameFormat

Write-Host "Results retrieved.  Process finished." -ForegroundColor Green

# Insert an end date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow