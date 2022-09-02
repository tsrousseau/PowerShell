Import-Module ActiveDirectory
Clear-Host

Write-Host "Updating attributes from CSV file.  Please stand by..." -ForegroundColor Cyan

# Insert a start date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Yellow

# Use a .csv file as your source input.  Updates the "telephoneNumber" field in AD.
# Note that even though we are updating "OfficePhone," this field actually maps to "telephoneNumber" in Active Directory.
Import-Csv ".\Source - AD Users List.csv" | ForEach-Object {Set-ADUser -Identity $_.SamAccountName -OfficePhone $_.OfficePhone}

Write-Host "Results retrieved.  Process finished." -ForegroundColor Green

# Insert an end date and timestamp.
$dateTime = Get-Date -Format "MM.dd.yyyy HH:mm:ss"
Write-Host "$dateTime" -ForegroundColor Cyan