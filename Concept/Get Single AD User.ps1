# Get all AD properties of a specified user.  Exports returned data to CSV file.
Get-ADUser tsrousseau -Properties * | Export-Csv "C:\Temp\Get Single AD User.csv" -notypeinformation

# Get certain AD properties of a specified user.  Exports data to CSV file.
Get-ADUser tsrousseau -Properties * | Select-Object Name, SamAccountName, EmployeeID, UserPrincipalName | Export-Csv "C:\Temp\Get Single AD User.csv" -NoTypeInformation

# Get all AD properties of a specified user.  Returns data to console.
Get-ADUser tsrousseau -Properties * | Select-Object *

# Get certain AD properties of a specified user.  Returns data to console.
Get-ADUser tsrousseau -Properties * | Select-Object Name, SamAccountName, EmployeeID, UserPrincipalName