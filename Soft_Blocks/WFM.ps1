# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\NICE_IEX_WFM\totalview\ttv40.exe"
Script NICE_WFM_4_6_distr{
    # DependsOn = '[]'
    TestScript = {
        if (Test-Path "C:\Program Files (x86)\NICE_IEX_WFM\totalview\ttv40.exe" -PathType Leaf){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        New-Item -ItemType Directory "C:\Temp\wfm_46" -Force | Out-Null
        Copy-Item -Path "\\server.domain.ru\SOFT\NICE_WFM\WFM_4.6-98916\*" -Recurse -Destination "C:\Temp\wfm_46\" -Force
        #
        $params = '-i silent'
        $SetupExe = "C:\Temp\wfm_46\WFM-4.6-98916-win32.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
        #
        Copy-Item -Path "\\server.domain.ru\SOFT\NICE_WFM\WFM_4.6-98916\config.ini" -Destination "C:\Program Files (x86)\NICE_IEX_WFM\totalview\configuration\config.ini" -Force
        Copy-Item -Path "\\server.domain.ru\SOFT\NICE_WFM\WFM_4.6-98916\WFM_4.6.lnk" -Destination "C:\Users\Public\Desktop\WFM_4.6.lnk" -Force
        #
        Start-Sleep -s 5
        Remove-Item -Path "C:\Temp\wfm_46\" -Force -Recurse -Confirm:$false -EA 0
    }
    GetScript = {
        # Do Nothing
    }
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\NICE_WFM\wfm\wfm.exe"
Script NICE_WFM_6_5_6_0_distr{
    # DependsOn = '[]'
    TestScript = {
        if (Test-Path "C:\Program Files (x86)\NICE_WFM\wfm\wfm.exe" -PathType Leaf){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        New-Item -ItemType Directory "C:\Temp\wfm_6" -Force | Out-Null
        Copy-Item -Path "\\server.domain.ru\SOFT\NICE_WFM\WFM_6.5.6.0\*" -Recurse -Destination "C:\Temp\wfm_6\" -Force
        #
        $params = '-jar C:\Temp\wfm_6\rcp-installer-6.5.6.0.jar C:\Temp\wfm_6\auto-install.xml'
        $SetupExe = "C:\Temp\wfm_6\jdk1.8.0_72\bin\java.exe"
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
        #
        Copy-Item -Path "\\server.domain.ru\SOFT\NICE_WFM\WFM_6.5.6.0\Workforce Management.lnk" -Destination "C:\Users\Public\Desktop\Workforce Management.lnk" -Force
        #
        Start-Sleep -s 5
        Remove-Item -Path "C:\Temp\wfm_6\" -Force -Recurse -Confirm:$false -EA 0
    }
    GetScript = {
        # Do Nothing
    }
}
