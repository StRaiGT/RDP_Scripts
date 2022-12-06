# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\apache-maven-3.6.1\bin\mvn"
File Apache_Maven_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Apache-Maven\apache-maven-3.6.1"
    DestinationPath = "C:\Program Files\apache-maven-3.6.1"
}

# Проверка не предусмотрена
Script Env_Path_Apache{
    DependsOn = "[File]Apache_Maven_distr"
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
        $list2add = "C:\Program Files\apache-maven-3.6.1\bin"
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
