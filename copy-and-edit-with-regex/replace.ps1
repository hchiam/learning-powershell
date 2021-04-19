(Get-Content output.css) `
    -replace '"(\d+),(\d{1,})"', '$1.$2' `
    -replace 'background: .+;', 'background: rgb(0,0,0,0);' |
Out-File output.css