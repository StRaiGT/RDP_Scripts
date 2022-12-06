# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java 7 Update 72 (64-bit)"
# $SoftGuid = "{26A24AE4-039D-4CA4-87B4-2F06417072FF}"
# $SoftPath = $null
Package jre-7u72x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java 7 Update 72 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jre-7u72-windows-x64.exe"
    ProductId = "{26A24AE4-039D-4CA4-87B4-2F06417072FF}"
    Arguments = '/s'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java 8 Update 121"
# $SoftGuid = "{26A24AE4-039D-4CA4-87B4-2F32180121F0}"
# $SoftPath = "C:\Program Files (x86)\Java\jre1.8.0_121"
Package jre-8u121x86{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java 8 Update 121"
    Path = "\\server.domain.ru\SOFT\java\jre-8u121-windows-i586.exe"
    ProductId = "{26A24AE4-039D-4CA4-87B4-2F32180121F0}"
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java 8 Update 121 (64-bit)"
# $SoftGuid = "{26A24AE4-039D-4CA4-87B4-2F64180121F0}"
# $SoftPath = "C:\Program Files\Java\jre1.8.0_121"
Package jre-8u121x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java 8 Update 121 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jre-8u121-windows-x64.exe"
    ProductId = "{26A24AE4-039D-4CA4-87B4-2F64180121F0}"
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java 8 Update 181"
# $SoftGuid = "{26A24AE4-039D-4CA4-87B4-2F32180181F0}"
# $SoftPath = "C:\Program Files (x86)\Java\jre1.8.0_181"
Package jre-8u181x86{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java 8 Update 181"
    Path = "\\server.domain.ru\SOFT\java\jre-8u181-windows-i586.exe"
    ProductId = "{26A24AE4-039D-4CA4-87B4-2F32180181F0}"
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java 8 Update 211"
# $SoftGuid = "{26A24AE4-039D-4CA4-87B4-2F32180211F0}"
# $SoftPath = "C:\Program Files (x86)\Java\jre1.8.0_211"
Package jre-8u211x32{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java 8 Update 211"
    Path = "\\server.domain.ru\SOFT\java\jre-8u211-windows-i586.exe"
    ProductId = "{26A24AE4-039D-4CA4-87B4-2F32180211F0}"
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java 8 Update 211 (64-bit)"
# $SoftGuid = "{26A24AE4-039D-4CA4-87B4-2F64180211F0}"
# $SoftPath = "C:\Program Files\Java\jre1.8.0_211"
Package jre-8u211x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java 8 Update 211 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jre-8u211-windows-x64.exe"
    ProductId = "{26A24AE4-039D-4CA4-87B4-2F64180211F0}"
    Arguments = 'INSTALL_SILENT=Enable'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# Проверка не предусмотрена
Script Java_Path{
    # Обязательно после всех JRE и JDK
    # DependsOn = '[]'
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
        $list2add = "C:\Program Files (x86)\Java\jre1.8.0_211\bin
        C:\Program Files (x86)\Java\jre1.8.0_211\bin\client"
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
