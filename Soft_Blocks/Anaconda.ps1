# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Anaconda3 2020.11 (Python 3.8.5 64-bit)"
# $SoftGuid = $null
# $SoftPath = $null
Script Anaconda_2020.11{
    # DependsOn = '[]'
    TestScript = {
        $path_install = "C:\Program Files\Anaconda3\python.exe"
        if (test-path $path_install){
            Write-Verbose 'ANACONDA FOUND'
            $true
        }else {
            Write-Verbose 'ANACONDA INSTALL IN PROCESS'
            $false
        }
    }
    SetScript = {
        $path_to_distr = 'C:\Temp\Anaconda_dsc.exe'
        if (!(Test-Path $path_to_distr -PathType Leaf)){
            Copy-item -Path '\\server.domain.ru\SOFT\Anaconda\Anaconda3-2020.11-Windows-x86_64.exe' -Destination 'C:\Temp\Anaconda_dsc.exe' -Force
        }
        Start-Process -FilePath "\\server.domain.ru\SOFT\Anaconda\setup_from_dsc.exe" -Wait -NoNewWindow
        Start-Sleep -Seconds 10
        Remove-item -Path 'C:\Temp\Anaconda_dsc.exe' -Force -Confirm:$false
    }
    GetScript = {
        # Do Nothing
    }
}
