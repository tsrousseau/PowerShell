Clear-Host
# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "Process started.  Please wait..." -ForegroundColor Yellow
Write-Host "$dateTime" -ForegroundColor Yellow

Import-Module ActiveDirectory
# Warning: this can be a lengthy process.
# Returns all data to a CSV file.

# Returns all AD attributes from all AD accounts in the domain.
Get-ADUser -Filter * -Properties * | Export-Csv "C:\Temp\Results - All AD Users And All Fields In Domain.csv" -NoTypeInformation -Append
# Add date and time to exported file.
$filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and All Fields in Domain.csv"
Rename-Item "C:\Temp\Results - All AD Users and All Fields in Domain.csv" -NewName $filenameFormat

# Insert an end date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "Results retrieved.  Process finished." -ForegroundColor Green
Write-Host "$dateTime" -ForegroundColor Green