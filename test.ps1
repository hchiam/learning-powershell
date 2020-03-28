# to run this file, right click on it inside File Explorer, and choose "Run with PowerShell"

# you can write a message to the PowerShell interface:
Write-Host 'Hi!'

# you can open a website in the user's default browser:
start https://microsoft.com # or: open https://microsoft.com

# you can navigate to folders like the desktop:
cd ~/Desktop

# you can create and run a function:
function wait3seconds {
  Start-Sleep -s 3
}

Write-Host 'This message should show up before the 3-second delay.'
wait3seconds
Write-Host 'This message should show up after 3 seconds.'

# here's a more complex example:

# you can download a file:
function downloadPythonInstaller {
  # download Python 3.7 for Windows:
  Invoke-WebRequest https://www.python.org/ftp/python/3.7.7/python-3.7.7-amd64.exe -OutFile ./setup-python-pc.exe
}

# you can run an exe:
function openPythonGraphicalInstaller {
  ./setup-python-pc.exe
}

# you can call functions within functions:
function installPythonIfMissing {
  $p = & { python -V } 2>&1
  if ($p -is [System.Management.Automation.ErrorRecord]) {
    Write-Host 'Python is not set up or installed. Attempting install now.'
    downloadPythonInstaller
    openPythonGraphicalInstaller
  }
  elseif ($PythonVersion -ne 3.7.7) {
    Write-Host 'Python 3.7.7 is not set up or installed. Attempting install now.'
    downloadPythonInstaller
    openPythonGraphicalInstaller
  }
}

# you can run pip once python is installed:
function installDependencies {
  # pip is included with Python 3.4+
  pip install eventlet
  pip install flask
  pip install flask_socketio
  pip install requests
  pip install pyOpenSSL==19.1.0
}
