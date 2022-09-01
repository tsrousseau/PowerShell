Clear-Host
# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "Process started.  Please wait..." -ForegroundColor Yellow
Write-Host "$dateTime" -ForegroundColor Yellow

Import-Module ActiveDirectory
# Warning: this can be a lengthy process.

# Returns specified fields for all AD users in the domain.
# Get-ADUser -Filter * -Properties SamAccountName, EmployeeID, Enabled, Department, Description | Select-Object SamAccountName, EmployeeID, Enabled, Department, Description | Export-Csv "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NoTypeInformation -Append
Get-ADUser -Filter * -Properties SamAccountName, HomePhone | Select-Object SamAccountName, HomePhone | Export-Csv "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NoTypeInformation -Append

# Add date and time to exported file.
$filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and Only Specified Fields in Domain.csv"
Rename-Item "C:\Temp\Results - All Users and Only Specified Fields in Domain.csv" -NewName $filenameFormat

# Insert an end date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "Results retrieved.  Process finished." -ForegroundColor Green
Write-Host "$dateTime" -ForegroundColor Green