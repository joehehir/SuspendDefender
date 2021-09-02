$Script:Properties = [PSCustomObject]@{
    OutputText = "SUCCESS!"
    OutputColor = "Green"
    SleepDuration = 3
    WindowWidth = 80
    WindowHeight = 8
}

function Script:Set-WindowSize {
    Param([Int]$Width, [Int]$Height)
    $MaxWindowSize = (Get-Host).UI.RawUI.MaxWindowSize
    $MaxWindowSize.Width = $Width
    $MaxWindowSize.Height = $Height
    (Get-Host).UI.RawUI.WindowSize = $MaxWindowSize
    (Get-Host).UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size($Width, $Height)
}

function Script:Get-CurrentScriptFileName {
    return [IO.Path]::GetFileNameWithoutExtension($PSCommandPath)
}

function Script:Start-ConsoleSleepTimer {
    Param([Int]$Duration)
    if ($Duration -lt 1) { return }

    # ANSI Escape Sequences
    $Escape = [Char]27
    Write-Host "${Escape}[s "
    $Duration..1 | ForEach-Object {
        Write-Host "${Escape}[u ($_)"
        Start-Sleep -Seconds 1
    }
}

function Script:Run {
    try {
        Script:Set-WindowSize $Script:Properties.WindowWidth $Script:Properties.WindowHeight
        Set-MpPreference -DisableRealtimeMonitoring $True -DisableCatchupFullScan $True -DisableCatchupQuickScan $True
    } catch {
        $Script:Properties.OutputText = "ERROR!"
        $Script:Properties.OutputColor = "Red"
    } finally {
        Write-Host "$(Script:Get-CurrentScriptFileName)> " -NoNewline
        Write-Host $Script:Properties.OutputText -ForegroundColor $Script:Properties.OutputColor -NoNewline
        Script:Start-ConsoleSleepTimer $Script:Properties.SleepDuration
    }
}

Script:Run
