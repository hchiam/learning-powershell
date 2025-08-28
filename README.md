# Learning PowerShell

Just one of the things I'm learning. <https://github.com/hchiam/learning>

Related repo: <https://github.com/hchiam/learning-bash-scripts>

Once you're in PowerShell, you can run the `test.ps1` file:

```powershell
cd learning-powershell
./test.ps1
```

## For MacOS

```bash
brew cask install powershell
pwsh
exit
```

## PowerShell command history

I personally like to use this:

```ps1
Get-History -Count 1 | Format-List -Property *; # for just the previous/last command
```

https://www.howtogeek.com/298244/how-to-use-your-command-history-in-windows-powershell

```ps1
Get-History

Get-History | Format-List -Property * # shows execution status and start/end times

Get-History | Export-Clixml -Path c:\users\name\desktop\commands.xml # saves history to a file

Clear-History

Clear # clears PowerShell window
```

## Beep

```ps1
[console]::beep(500,2000)
```

(1st parameter adjusts frequency, 2nd parameter adjusts duration)

## Notify when build is done and show status

```ps1
npm run build; [console]::beep(400,2000);

Get-History -Count 1 | Format-List -Property *; # you canNOT run this in a one-liner combined with the previous command, because I found it ends up printing history for the last one-liner that you entered, not for the combined one-liner that includes this history command
```

## Set up custom PowerShell commands in 3 steps

1) To set up custom commands, set up a profile file in one of the profile folders: 
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3

2) Then add custom commands in that profile file: 
https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module?view=powershell-7.3

3) And then restart powershell (if you have it already open). You can now run those custom commands!

Example custom commands `test` and `hist` in your $PROFILE file: 

```ps1
function test {
    param()
    Write-Output "test output"
}

function hist {
    Get-History -Count 5 | Format-List -Property *;
    Get-History;
}
```

## Check if command exists

```ps
Get-Command somecustomcommand

function somecustomcommand {
    npm run clean;
    npm i;
    npm run build;
}
```

## Next line of code continues running even if previous line had error

```ps
function exampleShowingCodeStillRunsEvenAfterErrorIfSeparateLines {
    asdfasdfasdf;
    echo "this still prints";
}
```

## Recursively delete file type

```ps
ls -r *.js | rm
```

or

```ps
ls -r your\path\*.js | rm
```

## To prompt/ask for input

```ps1
Read-Host "Hit enter to continue";
```

## Format PowerShell CLI with custom styling

https://www.youtube.com/watch?v=gOFsACMBEac

```ps
Test-Path $PROFILE
# likely prints out False

New-Item -Path $PROFILE -Type File -Force

notepad $PROFILE
```

```txt
function prompt {
  $path = $(Get-Location).Path
  $path = $path.ToLower() -replace '^([a-z]):', '/$1' -replace '\\', '/' # unix style path
  Write-Host ""
  Write-Host $path -ForegroundColor Black -BackgroundColor Cyan
  Write-Host "> " -NoNewLine -ForegroundColor Black -BackgroundColor Cyan
}
```

```ps
.$PROFILE
# and if get disabled error
Set-ExecutionPolicy RemoteSigned
# y
.$PROFILE
```

## names of folders only immediately under ".": 
```ps
Get-ChildItem -Path "." -Directory
```

## number of folders only immediately under ".": 
```ps
(Get-ChildItem -Path "." -Directory).Count
```

## names of folders 2 levels below ".": 
```ps
Get-ChildItem -Path . -Directory -Recurse | Where-Object { $_.FullName.Split('\').Count -eq ((Get-Location).Path.Split('\').Count + 2) }
```

## number of folders 2 levels below ".": 
```ps
(Get-ChildItem -Path . -Directory -Recurse | Where-Object { $_.FullName.Split('\').Count -eq ((Get-Location).Path.Split('\').Count + 2) }).Count
```

## number of files with specific name 'example.txt' at 2 levels below ".": 
```ps
(Get-ChildItem -Path . -Recurse | Where-Object { $_.FullName.Split('\').Count -eq ((Get-Location).Path.Split('\').Count + 2) -and $_.Name -eq 'example.txt' }).Count
```

## write the names of folders 4 levels below "." to a file "U:\Downloads\out.txt":
```ps
Get-ChildItem -Path . -Directory -Recurse | Where-Object { $_.FullName.Split('\').Count -eq ((Get-Location).Path.Split('\').Count + 4) } | Out-File -FilePath "U:\Downloads\out.txt"
```

## write to file:

```ps
# ... | Out-File -FilePath "U:\Downloads\out.txt"
```
