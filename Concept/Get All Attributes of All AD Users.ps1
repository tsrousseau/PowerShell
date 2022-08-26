Clear-Host
# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow

Import-Module ActiveDirectory
# Warning: this can be a lengthy process.
# Returns all data to a CSV file.

# Returns all AD attributes from all AD accounts in the domain.
Get-ADUser -Filter * -Properties * | Export-Csv "C:\Temp\Results - All Users And All Fields In Domain.csv" -NoTypeInformation -Append

# Insert an end date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Green