# Download and install Sysmon
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "Sysmon.zip"
Expand-Archive -Path "Sysmon.zip" -DestinationPath "C:\Sysmon"
Remove-Item -Path "Sysmon.zip" -Recurse

# Configure Sysmon
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml" -OutFile "C:\Sysmon\config.xml"
Invoke-Expression "C:\Sysmon\Sysmon64.exe -accepteula -i 'C:\Sysmon\config.xml'"

# Download and install NineFort Agent
New-Item -ItemType Directory -Force -Path "C:\Program Files\NineFort\NineFort Agent"
Invoke-WebRequest -Uri "https://cdn.ninefort.com/agent_updates/release/installer/v1.0.3/ninefort_agent_installer.exe" -OutFile "C:\Program Files\NineFort\NineFort Agent\ninefort_agent_installer.exe"
Start-Process "C:\Program Files\NineFort\NineFort Agent\ninefort_agent_installer.exe" -ArgumentList 'install', '10.50.1.191', 'bmluZWZvcnR8cDhiME5LZUhjUHRySVZCTGlkNHBTaDFES1J6NStRWEFvei9Mcy9BOHF4RT0=', 'yes' -NoNewWindow -Wait