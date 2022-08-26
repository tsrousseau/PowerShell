Clear-Host
# Insert a date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow -BackgroundColor Black

Import-Module ActiveDirectory
# Warning: this can be a lengthy process.
# Returns all data to a CSV file.

# Returns specified fields for all AD users in the domain.
Get-ADUser -Filter * -Properties * | Select-Object SamAccountName, DisplayName, EmployeeID, Enabled, Department, Description  | Export-Csv "C:\Temp\Results - All Users and Specified Fields in Domain.csv" -NoTypeInformation -Append

# Insert a date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Green -BackgroundColor Black