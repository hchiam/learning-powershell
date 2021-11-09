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
