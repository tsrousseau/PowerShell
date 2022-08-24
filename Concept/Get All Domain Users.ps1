# Gets all AD attributes from all users in the domain.
# Warning: this can be a lengthy process.
# Returns all data to a CSV file.
Get-ADUser -Filter * -Properties * | Select-Object SamAccountName, DisplayName, EmployeeID, Enabled, Department, Description  | Export-Csv "C:\Temp\Results - All Users in Domain.csv" -NoTypeInformation -Append