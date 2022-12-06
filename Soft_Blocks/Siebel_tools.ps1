# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Siebel\FS"
# Создаем папку FS, даём на неё FullControl для пользователей
Script sbltools_fs_folder{
    # DependsOn = '[]'
    TestScript = {
        $path_FS = 'C:\Siebel\FS'
        if (test-path $path_FS){
            Write-Verbose 'SIEBEL TOOLS - FS FOUND'
            $true
        }else {
            Write-Verbose 'SIEBEL TOOLS - FS NOT FOUND'
            $false
        }
    }
    #
    SetScript = {
        New-Item -type Directory -Force 'C:\Siebel\FS' | Out-Null
        $name = (Get-LocalGroup -SID S-1-5-32-545).name
        $Obj = Get-Item 'C:\Siebel\FS'
        $acl = Get-Acl $Obj
        if ($Obj.Mode -like 'd*----'){
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
        }
        $acl.SetAccessRule($accessRule)
        $Fullname = $Obj.FullName
        Set-Acl $Fullname $acl

    }
    #
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Siebel\8.1\Tools_1\BIN"
# Ставим
Script install_sbltools{
    DependsOn = "[Script]sbltools_fs_folder"
    #
    TestScript = {
        $path_install = 'C:\Siebel\8.1\Tools_1\BIN'
        if (test-path $path_install){
            Write-Verbose 'SIEBEL TOOLS FOUND'
            $true
        }else {
            Write-Verbose 'SIEBEL TOOLS - INSTALL IN PROCESS'
            $false
        }
    }
    #
    SetScript = {
    $params = "-silent -noconsole -ignoreSysPrereqs -waitforcompletion -logLevel warning -responseFile \\server.domain.ru\SOFT\sbltools\sbltools.rsp"
    $SetupExe = "\\server.domain.ru\SOFT\sbltools\client\Base\Windows\Client\Siebel_Tools\Disk1\install\oui.exe"
    Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
    $log_path = (get-item 'C:\Program Files (x86)\Oracle\Inventory\logs\*.log' | sort -Descending LastWriteTime | select -First 1).FullName
    $install_log = gc $log_path | select -last 6
    if ($install_log -match "was successful\.$"){
        $pc_name = $env:computername
        "Setup OK" > "\\server.domain.ru\Logs\sbltools\$pc_name`_sbltools.txt"
    }else{
        $pc_name = $env:computername
        "Setup BAD" > "\\server.domain.ru\Logs\sbltools\$pc_name`_sbltools.txt"
    }
    }
    #
    GetScript = {
        # Do Nothing
    }
}

# Проверка не предусмотрена
# Заменяем файлы
Script tools_cfg{
    DependsOn = "[Script]install_sbltools"
    TestScript = {
            $false
    }
    #
    SetScript = {
        Copy-Item -Path '\\server.domain.ru\SOFT\sbltools\tools.cfg' -Destination 'C:\Siebel\8.1\Tools_1\BIN\ENU\tools.cfg' -Force
        Copy-Item -Path '\\server.domain.ru\SOFT\sbltools\siebel_sia.srf' -Destination 'C:\Siebel\8.1\Tools_1\OBJECTS\ENU\siebel_sia.srf' -Force
    }
    #
    GetScript = {
        # Do Nothing
    }
}
