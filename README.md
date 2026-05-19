# The-Strongest-Battlegrounds-Killer

## 🪟 How to Use on Windows

The Windows script uses **PowerShell** to scan local logs.

### Manual Execution:
1. Download the `tsbkiller.ps1` file.
2. Right-click on it and select **Run with PowerShell**.

### Permanent Execution (Start automatically in the background):
To make it run invisibly in the background every time you turn on your PC:
1. Create a text file in the same folder named `launch.vbs` and paste the following inside:
   ```vbs
   CreateObject("Wscript.Shell").Run "powershell.exe -NoProfile -WindowStyle Hidden -File ""tsbkiller.ps1""", 0, True

    Press Windows + R, type shell:startup, and hit Enter.

    Move both the launch.vbs file and your tsbkiller.ps1 script into that folder.

How to Use on Linux (Sober Flatpak)

The Linux script is written in Bash and is specifically tailored for the Sober Flatpak environment.
Manual Execution:

    Download the tsbkiller.sh file.

    Grant execution permissions from your terminal:
    Bash

    chmod +x tsbkiller.sh

    Run it before opening your game:
    Bash

    ./tsbkiller.sh

Permanent Execution (Background Systemd Service):

To keep it permanently active in the background as a user service:

    Open your terminal (if using fish, type bash first) and run the following commands:
    Bash

    mkdir -p ~/.config/systemd/user/

    cat << 'EOF' > ~/.config/systemd/user/anti-tsb.service
    [Unit]
    Description=Background Blocker for Sober TSB
    After=graphical-session.target

    [Service]
    ExecStart=%h/Descargas/tsbkiller.sh
    Restart=always
    RestartSec=3

    [Install]
    WantedBy=default.target
    EOF

    systemctl --user daemon-reload
    systemctl --user enable --now anti-tsb.service

    (Note: Make sure the path in ExecStart accurately matches the location where you saved your tsbkiller.sh script).
