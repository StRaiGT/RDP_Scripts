# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\client\product_32\11.2.0\client_1\BIN\orabase.exe"
Script install_ora_11_32{
    # DependsOn = '[]'
    TestScript = {
        $path_install = 'C:\app\client\product_32\11.2.0\client_1'
        if (test-path $path_install){
            Write-Verbose ''
            Write-Verbose 'ORACLE FOUND'
            Write-Verbose ''
            $true
        }else {
            Write-Verbose ''
            Write-Verbose 'ORACLE INSTALL IN PROCESS'
            Write-Verbose ''
            $false
        }
    }
    SetScript = {
        $ora_tmp_path = 'c:\temp\ora_install\ora_11_32'
        if (!(Test-Path $ora_tmp_path)){
            New-Item -ItemType Directory $ora_tmp_path -force | Out-Null
            Copy-Item -Path "\\server.domain.ru\SOFT\Oracle\Oracle 11\x32\*" -Destination $ora_tmp_path -Recurse -Force
        }
        $params = "-silent -ignoreSysPrereqs -ignorePrereq -logLevel warning -noconsole -force -waitforcompletion -noconfig -responseFile c:\temp\ora_install\ora_11_32\client_install.rsp"
        $oracleClientExe = "c:\temp\ora_install\ora_11_32\setup.exe"
        Start-Process -FilePath $oracleClientExe -ArgumentList $params -Wait
        $log_path = (get-item 'C:\Program Files (x86)\Oracle\Inventory\logs\*.out' | sort -Descending | select -First 1).FullName
        $install_log = gc $log_path | select -last 6
        if ($install_log -match "^Successfully"){
            $pc_name = $env:computername
            "Setup OK" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_11_32.txt"
        }else{
            $pc_name = $env:computername
            "Setup BAD" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_11_32.txt"
        }
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Windows\SysWOW64\ora11"
Script symlink_ora_11_32{
    DependsOn = "[Script]install_ora_11_32"
    TestScript = {
        $sym_path = 'C:\Windows\SysWOW64\ora11'
        if (test-path $sym_path){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        &"C:\windows\system32\cmd.exe" '/c' 'mklink /D C:\Windows\SysWOW64\ora11 C:\app\client\product_32\11.2.0\client_1'
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\client\product_64\11.2.0\client_1\BIN\orabase.exe"
Script install_ora_11_64{
    DependsOn = '[Script]symlink_ora_11_32'
    TestScript = {
        $path_install = 'C:\app\client\product_64\11.2.0\client_1'
        if (test-path $path_install){
            Write-Verbose ''
            Write-Verbose 'ORACLE FOUND'
            Write-Verbose ''
            $true
        }else {
            Write-Verbose ''
            Write-Verbose 'ORACLE INSTALL IN PROCESS'
            Write-Verbose ''
            $false
        }
    }
    SetScript = {
        $ora_tmp_path = 'c:\temp\ora_install\ora_11_64'
        if (!(Test-Path $ora_tmp_path)){
            New-Item -ItemType Directory $ora_tmp_path -force | Out-Null
            Copy-Item -Path "\\server.domain.ru\SOFT\Oracle\Oracle 11\x64\*" -Destination $ora_tmp_path -Recurse -Force
        }
        $params = "-silent -ignoreSysPrereqs -ignorePrereq -logLevel warning -noconsole -force -waitforcompletion -noconfig -responseFile c:\temp\ora_install\ora_11_64\client_install.rsp"
        $oracleClientExe = "c:\temp\ora_install\ora_11_64\setup.exe"
        Start-Process -FilePath $oracleClientExe -ArgumentList $params -Wait
        $log_path = (get-item 'C:\Program Files\Oracle\Inventory\logs\*.out' | sort -Descending LastWriteTime | select -First 1).FullName
        $install_log = gc $log_path | select -last 6
        if ($install_log -match "^Successfully"){
            $pc_name = $env:computername
            "Setup OK" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_11_64.txt"
        }else{
            $pc_name = $env:computername
            "Setup BAD" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_11_64.txt"
        }
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Windows\System32\ora11"
Script symlink_ora_11_64{
    DependsOn = '[Script]install_ora_11_64'
    TestScript = {
        $sym_path = 'C:\Windows\System32\ora11'
        if (test-path $sym_path){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        &"C:\windows\system32\cmd.exe" '/c' 'mklink /D C:\Windows\System32\ora11 C:\app\client\product_64\11.2.0\client_1'
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\client\product_32\18.0.0\client_1\BIN\orabase.exe"
Script install_ora_18_32{
    DependsOn = '[Script]symlink_ora_11_64'
    TestScript = {
        $path_install = 'C:\app\client\product_32\18.0.0\client_1'
        if (test-path $path_install){
            Write-Verbose ''
            Write-Verbose 'ORACLE - FOUND'
            Write-Verbose ''
            $true
        }else {
            Write-Verbose ''
            Write-Verbose 'ORACLE - INSTALL IN PROCESS'
            Write-Verbose ''
            $false
        }
    }
    SetScript = {
        $ora_tmp_path = 'c:\temp\ora_install\ora_18_32'
        if (!(Test-Path $ora_tmp_path)){
            New-Item -ItemType Directory $ora_tmp_path -force | Out-Null
            Copy-Item -Path "\\server.domain.ru\SOFT\Oracle\Oracle 18\x32\*" -Destination $ora_tmp_path -Recurse -Force
        }
        $params = "-silent -noconsole -ignoreSysPrereqs -ignorePrereq -waitforcompletion -suppressPreCopyScript -acceptUntrustedificates -suppressPostCopyScript -ignoreInternalDriverError -logLevel warning -responseFile c:\temp\ora_install\ora_18_32\client_install.rsp"
        $oracleClientExe = "c:\temp\ora_install\ora_18_32\setup.exe"
        Start-Process -FilePath $oracleClientExe -ArgumentList $params -Wait
        $log_path = (get-item 'C:\Program Files (x86)\Oracle\Inventory\logs\*.out' | sort -Descending LastWriteTime | select -First 1).FullName
        $install_log = gc $log_path | select -last 6
        if ($install_log -match "^Successfully"){
            $pc_name = $env:computername
            "Setup OK" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_18_32.txt"
        }else{
            $pc_name = $env:computername
            "Setup BAD" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_18_32.txt"
        }
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Windows\SysWOW64\ora18"
Script symlink_ora_18_32{
    DependsOn = '[Script]install_ora_18_32'
    TestScript = {
        $sym_path = 'C:\Windows\SysWOW64\ora18'
        if (test-path $sym_path){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        &"C:\windows\system32\cmd.exe" '/c' 'mklink /D C:\Windows\SysWOW64\ora18 C:\app\client\product_32\18.0.0\client_1\'
    }
    GetScript = {
        # Do Nothing
    }
}

# Проверка не предусмотрена
Registry ora_18_32_codepage{
    DependsOn = '[Script]symlink_ora_18_32'
    Key = "HKLM:\SOFTWARE\WOW6432Node\ORACLE\KEY_OraClient18Home1_32bit"
    ValueName = "NLS_LANG"
    Ensure = "Present"
    ValueData = 'RUSSIAN_RUSSIA.CL8MSWIN1251'
    ValueType = "String"
    Force = $true
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\client\product_64\18.0.0\client_1\BIN\orabase.exe"
Script install_ora_18_64{
    DependsOn = '[Registry]ora_18_32_codepage'
    TestScript = {
        $path_install = 'C:\app\client\product_64\18.0.0\client_1'
        if (test-path $path_install){
            Write-Verbose ''
            Write-Verbose 'ORACLE FOUND'
            Write-Verbose ''
            $true
        }else {
            Write-Verbose ''
            Write-Verbose 'ORACLE INSTALL IN PROCESS'
            Write-Verbose ''
            $false
        }
    }
    SetScript = {
        $ora_tmp_path = 'c:\temp\ora_install\ora_18_64'
        if (!(Test-Path $ora_tmp_path)){
            New-Item -ItemType Directory $ora_tmp_path -force | Out-Null
            Copy-Item -Path "\\server.domain.ru\SOFT\Oracle\Oracle 18\x64\*" -Destination $ora_tmp_path -Recurse -Force
        }
        $params = "-silent -noconsole -ignorePrereqFailure -waitforcompletion -logLevel warning -suppressPreCopyScript -acceptUntrustedCertificates -suppressPostCopyScript -ignoreInternalDriverError -responseFile c:\temp\ora_install\ora_18_64\client_install.rsp"
        $oracleClientExe = "c:\temp\ora_install\ora_18_64\setup.exe"
        Start-Process -FilePath $oracleClientExe -ArgumentList $params -Wait
        $log_path = (get-item 'C:\Program Files\Oracle\Inventory\logs\*.out' | sort -Descending LastWriteTime | select -First 1).FullName
        $install_log = gc $log_path | select -last 6
        if ($install_log -match "^Successfully"){
            $pc_name = $env:computername
            "Setup OK" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_18_64.txt"
        }else{
            $pc_name = $env:computername
            "Setup BAD" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_18_64.txt"
        }
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Windows\System32\ora18"
Script symlink_ora_18_64{
    DependsOn = '[Script]install_ora_18_64'
    TestScript = {
        $sym_path = 'C:\Windows\System32\ora18'
        if (test-path $sym_path){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        &"C:\windows\system32\cmd.exe" '/c' 'mklink /D C:\Windows\System32\ora18 C:\app\client\product_64\18.0.0\client_1\'
    }
    GetScript = {
        # Do Nothing
    }
}

# Проверка не предусмотрена
Registry ora_18_64_codepage{
    DependsOn = '[Script]symlink_ora_18_64'
    Key = "HKLM:\SOFTWARE\Oracle\KEY_OraClient18Home1"
    ValueName = "NLS_LANG"
    Ensure = "Present"
    ValueData = 'RUSSIAN_RUSSIA.CL8MSWIN1251'
    ValueType = "String"
    Force = $true
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\client\product_32\19.0.0\client_1\BIN\orabase.exe"
Script install_ora_19_32{
    DependsOn = '[Registry]ora_18_64_codepage'
    TestScript = {
        $path_install = 'C:\app\client\product_32\19.0.0\client_1'
        if (test-path $path_install){
            Write-Verbose ''
            Write-Verbose 'ORACLE - FOUND'
            Write-Verbose ''
            $true
        }else {
            Write-Verbose ''
            Write-Verbose 'ORACLE - INSTALL IN PROCESS'
            Write-Verbose ''
            $false
        }
    }
    SetScript = {
        $ora_tmp_path = 'c:\temp\ora_install\ora_19_32'
        if (!(Test-Path $ora_tmp_path)){
            New-Item -ItemType Directory $ora_tmp_path -force | Out-Null
            Copy-Item -Path "\\server.domain.ru\SOFT\Oracle\Oracle 19\x32\*" -Destination $ora_tmp_path -Recurse -Force
        }
        $params = "-silent -noconsole -ignoreSysPrereqs -ignorePrereq -waitforcompletion -suppressPreCopyScript -acceptUntrustedCertificates -suppressPostCopyScript -ignoreInternalDriverError -logLevel warning -responseFile c:\temp\ora_install\ora_19_32\client_install.rsp"
        $oracleClientExe = "c:\temp\ora_install\ora_19_32\setup.exe"
        Start-Process -FilePath $oracleClientExe -ArgumentList $params -Wait
        $log_path = (get-item 'C:\Program Files (x86)\Oracle\Inventory\logs\*.out' | sort -Descending LastWriteTime | select -First 1).FullName
        $install_log = gc $log_path | select -last 6
        if ($install_log -match "^Successfully"){
            $pc_name = $env:computername
            "Setup OK" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_19_32.txt"
        }else{
            $pc_name = $env:computername
            "Setup BAD" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_19_32.txt"
        }
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Windows\SysWOW64\ora19"
Script symlink_ora_19_32{
    DependsOn = '[Script]install_ora_19_32'
    TestScript = {
        $sym_path = 'C:\Windows\SysWOW64\ora19'
        if (test-path $sym_path){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        &"C:\windows\system32\cmd.exe" '/c' 'mklink /D C:\Windows\SysWOW64\ora19 C:\app\client\product_32\19.0.0\client_1\'
    }
    GetScript = {
        # Do Nothing
    }
}

# Проверка не предусмотрена
Registry ora_19_32_codepage{
    DependsOn = '[Script]symlink_ora_19_32'
    Key = "HKLM:\SOFTWARE\WOW6432Node\ORACLE\KEY_OraClient19Home1_32bit"
    ValueName = "NLS_LANG"
    Ensure = "Present"
    ValueData = 'RUSSIAN_RUSSIA.CL8MSWIN1251'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_32_NLS_CURRENCY{
    DependsOn = '[Registry]ora_19_32_codepage'
    Key = "HKLM:\SOFTWARE\WOW6432Node\ORACLE\KEY_OraClient19Home1_32bit"
    ValueName = "NLS_CURRENCY"
    Ensure = "Present"
    ValueData = '$'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_32_NLS_DATE_FORMAT{
    DependsOn = '[Registry]ora_19_32_NLS_CURRENCY'
    Key = "HKLM:\SOFTWARE\WOW6432Node\ORACLE\KEY_OraClient19Home1_32bit"
    ValueName = "NLS_DATE_FORMAT"
    Ensure = "Present"
    ValueData = 'DD-MON-RR'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_32_NLS_NUMERIC_CHARACTERS{
    DependsOn = '[Registry]ora_19_32_NLS_DATE_FORMAT'
    Key = "HKLM:\SOFTWARE\WOW6432Node\ORACLE\KEY_OraClient19Home1_32bit"
    ValueName = "NLS_NUMERIC_CHARACTERS"
    Ensure = "Present"
    ValueData = '.,'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_32_NLS_SORT{
    DependsOn = '[Registry]ora_19_32_NLS_NUMERIC_CHARACTERS'
    Key = "HKLM:\SOFTWARE\WOW6432Node\ORACLE\KEY_OraClient19Home1_32bit"
    ValueName = "NLS_SORT"
    Ensure = "Present"
    ValueData = 'BINARY'
    ValueType = "String"
    Force = $true
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\client\product_64\19.0.0\client_1\BIN\orabase.exe"
Script install_ora_19_64{
    DependsOn = '[Registry]ora_19_32_NLS_SORT'
    TestScript = {
        $path_install = 'C:\app\client\product_64\19.0.0\client_1'
        if (test-path $path_install){
            Write-Verbose ''
            Write-Verbose 'ORACLE FOUND'
            Write-Verbose ''
            $true
        }else {
            Write-Verbose ''
            Write-Verbose 'ORACLE INSTALL IN PROCESS'
            Write-Verbose ''
            $false
        }
    }
    SetScript = {
        $ora_tmp_path = 'c:\temp\ora_install\ora_19_64'
        if (!(Test-Path $ora_tmp_path)){
            New-Item -ItemType Directory $ora_tmp_path -force | Out-Null
            Copy-Item -Path "\\server.domain.ru\SOFT\Oracle\Oracle 19\x64\*" -Destination $ora_tmp_path -Recurse -Force
        }
        $params = "-silent -noconsole -ignorePrereqFailure -waitforcompletion -logLevel warning -suppressPreCopyScript -acceptUntrustedCertificates -suppressPostCopyScript -ignoreInternalDriverError -responseFile c:\temp\ora_install\ora_19_64\client_install.rsp"
        $oracleClientExe = "c:\temp\ora_install\ora_19_64\setup.exe"
        Start-Process -FilePath $oracleClientExe -ArgumentList $params -Wait
        $log_path = (get-item 'C:\Program Files\Oracle\Inventory\logs\*.out' | sort -Descending LastWriteTime | select -First 1).FullName
        $install_log = gc $log_path | select -last 6
        if ($install_log -match "^Successfully"){
            $pc_name = $env:computername
            "Setup OK" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_19_64.txt"
        }else{
            $pc_name = $env:computername
            "Setup BAD" > "\\server.domain.ru\Logs\Ora\$pc_name`_ora_19_64.txt"
        }
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Windows\System32\ora19"
Script symlink_ora_19_64{
    DependsOn = '[Script]install_ora_19_64'
    TestScript = {
        $sym_path = 'C:\Windows\System32\ora19'
        if (test-path $sym_path){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        &"C:\windows\system32\cmd.exe" '/c' 'mklink /D C:\Windows\System32\ora19 C:\app\client\product_64\19.0.0\client_1\'
    }
    GetScript = {
        # Do Nothing
    }
}

# Проверка не предусмотрена
Registry ora_19_64_codepage{
    DependsOn = '[Script]symlink_ora_19_64'
    Key = "HKLM:\SOFTWARE\Oracle\KEY_OraClient19Home1"
    ValueName = "NLS_LANG"
    Ensure = "Present"
    ValueData = 'RUSSIAN_RUSSIA.CL8MSWIN1251'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_64_NLS_CURRENCY{
    DependsOn = '[Registry]ora_19_64_codepage'
    Key = "HKLM:\SOFTWARE\Oracle\KEY_OraClient19Home1"
    ValueName = "NLS_CURRENCY"
    Ensure = "Present"
    ValueData = '$'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_64_NLS_DATE_FORMAT{
    DependsOn = '[Registry]ora_19_64_NLS_CURRENCY'
    Key = "HKLM:\SOFTWARE\Oracle\KEY_OraClient19Home1"
    ValueName = "NLS_DATE_FORMAT"
    Ensure = "Present"
    ValueData = 'DD-MON-RR'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_64_NLS_NUMERIC_CHARACTERS{
    DependsOn = '[Registry]ora_19_64_NLS_DATE_FORMAT'
    Key = "HKLM:\SOFTWARE\Oracle\KEY_OraClient19Home1"
    ValueName = "NLS_NUMERIC_CHARACTERS"
    Ensure = "Present"
    ValueData = '.,'
    ValueType = "String"
    Force = $true
}

# Проверка не предусмотрена
Registry ora_19_64_NLS_SORT{
    DependsOn = '[Registry]ora_19_64_NLS_NUMERIC_CHARACTERS'
    Key = "HKLM:\SOFTWARE\Oracle\KEY_OraClient19Home1"
    ValueName = "NLS_SORT"
    Ensure = "Present"
    ValueData = 'BINARY'
    ValueType = "String"
    Force = $true
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\app\tnsnames\tnsnames.ora"
File tns_for_ora{
    DependsOn = "[Registry]ora_19_64_NLS_SORT"
    Ensure = "Present"
    Type = "File"
    Recurse = $false
    SourcePath = "\\server.domain.ru\SOFT\Oracle\tnsnames\psd.ora"
    DestinationPath = "C:\app\tnsnames\tnsnames.ora"
}

# Проверка не предусмотрена
Script Env_Path_ORA{
    DependsOn = "[File]tns_for_ora"
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
        $list2add = "C:\Windows\System32\ora19\bin
        C:\Windows\System32\ora18\bin
        C:\Windows\System32\ora11\bin"
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

# Проверка не предусмотрена
Environment Env_for_Ora_tns_admin{
    DependsOn = '[Script]Env_Path_ORA'
    Name = 'TNS_ADMIN'
    Path = $false
    Value = "C:\app\tnsnames"
    Ensure = 'Present'
}
