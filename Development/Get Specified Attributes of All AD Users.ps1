Import-Module ActiveDirectory
Remove-Item "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -ErrorAction Ignore
Clear-Host

# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow

Write-Host "Retrieving specific attributes for all users.  Please stand by..." -ForegroundColor Cyan

# Returns specified fields for all AD users in the domain.
Get-ADUser -Filter *  -Properties SamAccountName, Department, EmailAddress | Select-Object SamAccountName, Department, extensionAttribute1, extensionAttribute2, extensionAttribute3, extensionAttribute4, extensionAttribute5, extensionAttribute6, extensionAttribute7, extensionAttribute8, extensionAttribute9, extensionAttribute10, extensionAttribute11, extensionAttribute12, extensionAttribute13, extensionAttribute14, extensionAttribute15, extensionAttribute16, extensionAttribute17, extensionAttribute18, extensionAttribute19, extensionAttribute20 | Export-Csv "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NoTypeInformation -Append

# Add date and time to exported file.
$filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and Only Specified Fields in Domain.csv"
Rename-Item "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NewName $filenameFormat

Write-Host "Results retrieved.  Process finished." -ForegroundColor Green

# Insert an end date and timestamp.
Write-Host "$dateTime" -ForegroundColor Yellow