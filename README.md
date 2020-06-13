# SuspendDefender
Prevents resource-intensive Windows Defender scans from running during the current session.

## Enable prompt at startup
1. Create a shortcut to **SuspendDefender.bat**.
2. With the start menu open, type `run`, then press enter.
3. Inside the Run window, type `shell:startup` to open the startup directory.
4. Move the **SuspendDefender.bat** shortcut into the startup directory.

## Disable prompt at startup
1. Repeat steps **2** and **3** above to open the startup directory.
2. Remove the **SuspendDefender.bat** shortcut from the startup directory.

## References
* [Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/defender/set-mppreference?view=win10-ps)
* [SS64.com](https://ss64.com/ps/)
