$targetPlaceId = "10449761463"
$logFolder = "$env:LOCALAPPDATA\Roblox\logs"

while ($true) {
    $robloxProcess = Get-Process -Name "RobloxPlayerBeta" -ErrorAction SilentlyContinue
    if ($robloxProcess) {
        $startTime = $robloxProcess[0].StartTime
        $latestLog = Get-ChildItem -Path $logFolder -Filter "*.log" | 
                     Where-Object { $_.LastWriteTime -ge $startTime.AddSeconds(-5) } | 
                     Sort-Object LastWriteTime -Descending | 
                     Select-Object -First 1

        if ($latestLog) {
            $logContent = Get-Content -Path $latestLog.FullName -Tail 150 -ErrorAction SilentlyContinue
            if ($logContent -and ($logContent -match $targetPlaceId)) {
                Stop-Process -Name "RobloxPlayerBeta" -Force -ErrorAction SilentlyContinue
            }
        }
    }
    Start-Sleep -Seconds 1
}
