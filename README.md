# testingx Install Agent

Run PowerShell as Administrator.
Execute the following commands in PowerShell:

set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\agent.ps1

Uninstall 

Sysmon64.exe -u force
Start-Process "C:\Program Files\NineFort\NineFort Agent\ninefort_agent_installer.exe" -ArgumentList 'uninstall' -NoNewWindow -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'stop','NineFortAgent' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'delete','NineFortAgent' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'stop','NineFortRedline' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'delete','NineFortRedline' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'stop','NineFortUpdater' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'delete','NineFortUpdater' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'stop','NineFortWindowsLogsCollector' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'delete','NineFortWindowsLogsCollector' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'stop','NineFortModulesLogsCollector' -Wait -ErrorAction SilentlyContinue | Out-Null; Start-Process -FilePath "sc.exe" -ArgumentList 'delete','NineFortModulesLogsCollector' -Wait -ErrorAction SilentlyContinue | Out-Null; Write-Host "Removing NineFort Agent dependencies..."; Start-Sleep -Seconds 10; Remove-Item 'C:\Program Files\NineFort' -Recurse -Force -ErrorAction Stop; Write-Host "NineFort Agent removed successfully."

