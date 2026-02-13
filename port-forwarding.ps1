function myadb {
    # _______SETUP NOTES:_______
    # Basically just download and run adb.exe on your computer and use chrome://inspect/#devices to inspect web pages that are in Chrome on your Android device.
    # (In Android device Settings, tap Build number x7 and allow USB debugging.)
    # https://developer.android.com/tools/releases/platform-tools#downloads
    # https://www.howtogeek.com/125769/how-to-install-and-use-abd-the-android-debug-bridge-utility/

    # _______TO RUN:_______
    cd C:\Downloads\your\path\to\platform-tools-latest-windows\platform-tools;
    ./adb devices; # NOTE: also makes adb.exe keep running in background even after you close terminal.
    ./adb.exe reverse tcp:1234 tcp:1234; # exposes port 1234 as 1234
    ./adb.exe reverse tcp:5173 tcp:5173; # exposes port 5173 as 5173
    # THEN open this special URL in Chrome to inspect Android Chrome pages:
    # chrome://inspect/#devices

    # _______MORE INFO:_______
    # Any public URLs will also be inspectable, not just exposed ports, in chrome://inspect/#devices
    # To stop the background running of adb / port reverse, stop adb.exe in Task Manager (./adb.exe reverse --remove-all didn't seem to work for me).
    # To see all options:  ./adb.exe
    # https://developer.android.com/tools/adb#forwardports
}