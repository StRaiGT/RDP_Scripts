# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "TSYS Card Tech Base Class Library 1.2.0.0"
# $SoftGuid = "{9A3BF1BF-6981-4458-ACCD-F8F4E85ADB54}"
# $SoftPath = "C:\Program Files (x86)\TSYS Card Tech\TSYS Card Tech Base Class Library 1.2.0.0\CTL.COM.dll"
Package TSYS_Library_1200{
    # DependsOn = '[]'
    Name = 'TSYS Card Tech Base Class Library 1.2.0.0'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\Prime Job Administrator PJA\TSYS Card Tech Base Class Library 1.2.0.0.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}

# $SoftRegName = "TSYS Card Tech Base Class Library 4.5.2.0"
# $SoftGuid = "{A67D17FD-B56D-41DE-80C2-09E9232BE0BA}"
# $SoftPath = "C:\Program Files (x86)\TSYS Card Tech\TSYS Card Tech Base Class Library 4.5.2.0\CTL.COM.dll"
Package TSYS_Library_4520{
    DependsOn = "[Package]TSYS_Library_1200"
    Name = 'TSYS Card Tech Base Class Library 4.5.2.0'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\Prime Job Administrator PJA\TSYS Card Tech Base Class Library 4.5.2.0.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}

# $SoftRegName = "PRIME 4 Jobs Administrator"
# $SoftGuid = "{46C88EF1-472E-4AFC-BB1A-8FF0BFE2E375}"
# $SoftPath = "C:\Program Files (x86)\TSYS Card Tech\PRIME 4\PRIME 4 Jobs Administrator\PRIME Jobs Administrator.exe"
Package PJA_old_client{
    DependsOn = "[Package]TSYS_Library_4520"
    Name = 'PRIME 4 Jobs Administrator'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\Prime Job Administrator PJA\PRIME 4 Jobs Administrator.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\TSYS Card Tech\PRIME 4\PRIME Jobs Administrator ACQ\PRIME Jobs Administrator.exe"
Script PJA_client_copy{
    DependsOn = "[Package]PJA_old_client"
    TestScript = {
        $path_ISS = 'C:\Program Files (x86)\TSYS Card Tech\PRIME 4\PRIME 4 Jobs Administrator ISS'
        $path_ACQ = 'C:\Program Files (x86)\TSYS Card Tech\PRIME 4\Prime Jobs Administrator ACQ'
        if ((test-path $path_ISS) -and (test-path $path_ACQ)){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        Copy-item -Path '\\server.domain.ru\SOFT\Prime Job Administrator PJA\PRIME 4 Jobs Administrator ISS\' -Destination 'C:\Program Files (x86)\TSYS Card Tech\PRIME 4\PRIME 4 Jobs Administrator ISS' -Force -Recurse
        Copy-item -Path '\\server.domain.ru\SOFT\Prime Job Administrator PJA\Prime Jobs Administrator ACQ\' -Destination 'C:\Program Files (x86)\TSYS Card Tech\PRIME 4\Prime Jobs Administrator ACQ' -Force -Recurse
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\TSYS Card Tech\PRIME 4\Prime Jobs Administrator_NEW\\PRIME Jobs Administrator.exe"
Script PJA_new{
    DependsOn = '[Script]PJA_client_copy'
    TestScript = {
        $false
    }
    #
    SetScript = {
        copy-item -Path "\\server.domain.ru\SOFT\Prime Job Administrator PJA\Prime Jobs Administrator_24Jun2021\" -Destination "C:\Program Files (x86)\TSYS Card Tech\PRIME 4\Prime Jobs Administrator_NEW\" -Force -Recurse
    }
    #
    GetScript = {
        # Do Nothing
    }
}

# Проверка не предусмотрена
Script PJA_reg_ora_dll{
    # Need ora18
    DependsOn = "[Script]PJA_new"
    TestScript = {
        $path_to_check = 'C:\Windows\Microsoft.NET\assembly\GAC_64\Oracle.DataAccess'
        if (test-path $path_to_check){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        Start-Process "\\server.domain.ru\SOFT\Prime Job Administrator PJA\reg_dll.bat" -Wait -NoNewWindow
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\temp\PJA_user_env.exe"
Script PJA_user_env{
    DependsOn = "[Script]PJA_reg_ora_dll"
    TestScript = {
        $path_to_check = 'C:\Temp\PJA_user_env.exe'
        if (test-path $path_to_check -PathType Leaf){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        Copy-Item -Path '\\server.domain.ru\SOFT\Prime Job Administrator PJA\PJA_user_env.exe' -Destination 'C:\temp\PJA_user_env.exe' -Force
        Copy-Item -Path '\\server.domain.ru\SOFT\Prime Job Administrator PJA\PJA_user_env.lnk' -Destination 'C:\Users\Public\Desktop\PJA_user_env.lnk' -Force
    }
    GetScript = {
        # Do Nothing
    }
}
