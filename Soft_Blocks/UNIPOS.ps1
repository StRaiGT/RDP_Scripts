# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\UNIPOS\ConfigManagerClient_2.4.10\ConfigManager.exe"
Script UNIPOS_ConfigManagerClient{
    # DependsOn = '[]'
    TestScript = {
        if (Test-Path "C:\Program Files\UNIPOS\ConfigManagerClient_2.4.10\ConfigManager.exe") {
            $true
        }else{
            $false
        }
    }
    SetScript = {
        Copy-Item -Path '\\server.domain.ru\SOFT\UNIPOS\ConfigManagerClient_2.4.10' -Destination 'C:\Program Files\UNIPOS\ConfigManagerClient_2.4.10' -Force -Recurse
        Copy-Item -Path '\\server.domain.ru\SOFT\UNIPOS\ConfigManagerClient_2.4.10\ConfigManagerClient.lnk' -Destination 'C:\Users\Public\Desktop\ConfigManagerClient_2.4.10.lnk' -Force

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
# $SoftPath = "C:\Program Files\UNIPOS\ConfigManagerStation_2.4.10\ConfigManager.exe"
Script UNIPOS_ConfigManagerStation{
    # DependsOn = '[]'
    TestScript = {
        if (Test-Path "C:\Program Files\UNIPOS\ConfigManagerStation_2.4.10\ConfigManager.exe") {
            $true
        }else{
            $false
        }
    }
    SetScript = {
        Copy-Item -Path '\\server.domain.ru\SOFT\UNIPOS\ConfigManagerStation_2.4.10' -Destination 'C:\Program Files\UNIPOS\ConfigManagerStation_2.4.10' -Force -Recurse
        Copy-Item -Path '\\server.domain.ru\SOFT\UNIPOS\ConfigManagerStation_2.4.10\ConfigManagerStation.lnk' -Destination 'C:\Users\Public\Desktop\ConfigManagerStation_2.4.10.lnk' -Force
    }
    GetScript = {
        # Do Nothing
    }
}
