# Disable ExecutionPolicy
set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Function Sleep-Progress($TotalSeconds) {
    $Counter = 0;
    for ($i = 0; $i -lt $TotalSeconds; $i++) {
        $Progress = [math]::Round(100 - (($TotalSeconds - $Counter) / $TotalSeconds * 100));
        Write-Progress -Activity "Waiting..." -Status "$Progress% Complete:" -SecondsRemaining ($TotalSeconds - $Counter) -PercentComplete $Progress;
        Start-Sleep 1
        $Counter++;
    }   
}
 
 Sleep-Progress 5



# Download and install Sysmon
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "Sysmon.zip"
Expand-Archive -Path "Sysmon.zip" -DestinationPath "C:\Program Files\Sysmon"
Remove-Item -Path "Sysmon.zip" -Recurse

# Configure Sysmon
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml" -OutFile "C:\Program Files\Sysmon\config.xml"
Invoke-Expression "C:\Program Files\Sysmon\Sysmon64.exe -accepteula -i 'C:\Program Files\Sysmon\config.xml'"



# Download and install NineFort Agent
New-Item -ItemType Directory -Force -Path "C:\Program Files\NineFort\NineFort Agent"
Invoke-WebRequest -Uri "https://cdn.ninefort.com/agent_updates/release/installer/v1.0.3/ninefort_agent_installer.exe" -OutFile "C:\Program Files\NineFort\NineFort Agent\ninefort_agent_installer.exe"
Start-Process "C:\Program Files\NineFort\NineFort Agent\ninefort_agent_installer.exe" -ArgumentList 'install', 'dev.core.id', 'ZGV2fENZMXI5TDVIVlVoM2tQNXdMSTNEcHAyU2lQeUt1dVF4TXNiMVNzNHZYd1E9', 'yes' -NoNewWindow -Wait