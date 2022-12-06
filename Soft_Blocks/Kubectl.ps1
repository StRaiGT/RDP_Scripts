# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\kubectl\kubectl.exe"
File kubectl{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\kubectl.exe"
    DestinationPath = "C:\kubectl\kubectl.exe"
}

# Автоматическая установка
# Не тормозит конвейер

# Проверка не предусмотрена
Script Env_Path_kubectl{
    DependsOn = "[File]kubectl"
    TestScript = {
        $cur_path = (Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
        if ($cur_path.length -gt 4000){
            Write-Error "Env:path length gt 4000"
            $true
        }else{
            $false
        }
    }
    #
    SetScript = {
        $list2add = "C:\kubectl"
        $list2add = ($list2add -split "`n").trim("")
        $cur_path = (Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
        $cur_path = ((($cur_path -split ';' | select -Unique) -replace "(\\)+","\").trim("")) -join ';'
        $test_path = ""
        $list2add | %{
            if($cur_path.Split(';') -notcontains $_){
                $test_path += $_ + ';'
            }else{
                Write-Verbose ' '
                Write-Verbose "$_ already in Env:Path"
                Write-Verbose ' '
            }
        }
        if($test_path -like ""){
            $new_path = $cur_path.Trim(";")
        }else{
            $new_path = $test_path + $cur_path.Trim(";")
        }
        if($new_path.length -le 4096){
            Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $new_path
        }else{
            Write-Error "New env:path length ge 4096"
        }
    }
    #
    GetScript = {
        # Do Nothing
    }
}
