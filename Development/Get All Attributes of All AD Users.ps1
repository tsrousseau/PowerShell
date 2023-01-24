Import-Module ActiveDirectory
Remove-Item "C:\Temp\Results - All AD Users and All Fields in Domain.csv" -ErrorAction Ignore
Clear-Host
# Insert a start date and time stamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Cyan
Write-Host "Warning: This process will take about twenty (20) minutes to complete." -ForegroundColor Red
Write-Host "Retrieving all users and all available attributes.  Please wait..." -ForegroundColor Yellow

# Returns all AD attributes from all AD accounts in the domain.
Get-ADUser -Filter * -Properties * | Export-Csv "C:\Temp\Results - All AD Users And All Fields In Domain.csv" -NoTypeInformation -Append

# Add date and time to exported file.
$filenameFormat = "Results - " + (Get-Date -Format "MM-dd-yyyy HH-mm-ss") + " - All Users and All Fields in Domain.csv"
Rename-Item "C:\Temp\Results - All AD Users and All Fields in Domain.csv" -NewName $filenameFormat

# Insert an end date and time stamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "Results retrieved.  Process finished." -ForegroundColor Green
Write-Host "$dateTime" -ForegroundColor Cyan