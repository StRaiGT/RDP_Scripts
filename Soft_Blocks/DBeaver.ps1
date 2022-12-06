# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "DBeaver 7.0.0"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\DBeaver_7\dbeaver.exe"

Package DBeaver_7_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "DBeaver 7.0.0"
    Path = "\\server.domain.ru\SOFT\DBeaver\dbeaver-ce-7.0.0-x86_64-setup.exe"
    ProductId = ""
    Arguments = '/S /allusers /D=C:\Program Files\DBeaver_7'
}
# ИЛИ
Script DBeaver_7_x64{
    # Использовать при установке нескольких версий DBeaver
    # DependsOn = ''
    TestScript = {
        if (Test-Path "C:\Program Files\DBeaver_7\dbeaver.exe"){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        $SetupExe = "\\server.domain.ru\SOFT\DBeaver\dbeaver-ce-7.0.0-x86_64-setup.exe"
        $params = '/S /allusers /D=C:\Program Files\DBeaver_7'
        Start-Process -FilePath $SetupExe -ArgumentList $params -Wait
    }
    GetScript = {
        # Do Nothing
    }
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\DBeaver 7.0.0.lnk"
File DBeaver_7_x64_lnk{
    DependsOn = '[Package]DBeaver_7_x64'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\DBeaver\DBeaver 7.0.0.lnk"
    DestinationPath = 'C:\Users\Public\Desktop\DBeaver 7.0.0.lnk'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "DBeaver 21.0.2"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\DBeaver_21\dbeaver.exe"
Package DBeaver_21_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "DBeaver 21.0.2"
    Path = "\\server.domain.ru\SOFT\DBeaver\dbeaver-ce-21.0.2-x86_64-setup.exe"
    ProductId = ""
    Arguments = '/S /allusers /D=C:\Program Files\DBeaver_21'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\DBeaver 21.0.2.lnk"
File DBeaver_21_x64_lnk{
    DependsOn = '[Package]DBeaver_21_x64'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\DBeaver\DBeaver 21.0.2.lnk"
    DestinationPath = 'C:\Users\Public\Desktop\DBeaver 21.0.2.lnk'
}
