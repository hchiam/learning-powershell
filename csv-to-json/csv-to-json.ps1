# (you'll likely have to manually save your .xlsx file as a .csv first)

# Remove-Item "example.json"

Import-Csv "example.csv" 
| ConvertTo-Json 
| Add-Content -Path "example.json"
