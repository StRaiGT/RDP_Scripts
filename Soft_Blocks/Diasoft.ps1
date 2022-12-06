# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Diasoft\MeNext 9.0.1\ClientApp.exe"
Script MeNext_9{
    # 9.0.1
    # DependsOn = '[]'
    TestScript = {
        $path_install = "C:\Diasoft\MeNext 9.0.1\"
        if (test-path $path_install){
            Write-Verbose 'MeNext FOUND'
            $true
        }
        else {
            Write-Verbose 'MeNext IN PROGRESS'
            $false
        }
    }
    SetScript = {
        $path_install = "C:\Diasoft\MeNext 9.0.1\"
        New-Item -ItemType Directory $path_install -force | Out-Null
        Copy-Item -Path "\\server.domain.ru\SOFT\Diasoft\MeNext 9.0.1\*" -Destination $path_install -Recurse -Force
        # add to exception DEP
        $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
        New-ItemProperty -Path $regPath -Name "C:\Diasoft\MeNext 9.0.1\AppDesigner.exe" -Value "DisableNXShowUI" -PropertyType String -Force | Out-Null
        New-ItemProperty -Path $regPath -Name "C:\Diasoft\MeNext 9.0.1\ClientApp.exe" -Value "DisableNXShowUI" -PropertyType String -Force | Out-Null
        New-ItemProperty -Path $regPath -Name "C:\Diasoft\MeNext 9.0.1\EntDict.exe" -Value "DisableNXShowUI" -PropertyType String -Force | Out-Null
        New-ItemProperty -Path $regPath -Name "C:\Diasoft\MeNext 9.0.1\MasterAdmin.exe" -Value "DisableNXShowUI" -PropertyType String -Force | Out-Null
        New-ItemProperty -Path $regPath -Name "C:\Diasoft\MeNext 9.0.1\MasterSQL.exe" -Value "DisableNXShowUI" -PropertyType String -Force | Out-Null
        New-ItemProperty -Path $regPath -Name "C:\Diasoft\MeNext 9.0.1\SltMan.exe" -Value "DisableNXShowUI" -PropertyType String -Force | Out-Null
    }
    GetScript = {
        # Do Nothing
    }
}
