# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\ProgramData\sqldeveloper\sqldeveloper.exe"
Script SQL_Developer{
    # DependsOn = '[]'
    # копирование файлов
    TestScript = {
        if (Test-Path "C:\ProgramData\sqldeveloper"){
            $true
        }else{
            $false
        }
    }
    #
    SetScript = {
        New-Item -ItemType Directory "c:\ProgramData\sqldeveloper" | Out-Null
        Copy-Item -Path '\\server.domain.ru\SOFT\sqldeveloper\*' -Destination 'C:\ProgramData\sqldeveloper' -Force -Recurse
        Copy-Item -Path '\\server.domain.ru\SOFT\sqldeveloper\sqldeveloper 21.4.lnk' -Destination 'C:\Users\Public\Desktop\SQL Developer.lnk' -Force
    }
    #
    GetScript = {
            # Do Nothing
    }
}

# Проверка не предусмотрена
Script SQL_Developer_folder{
    DependsOn = "[Script]SQL_Developer"
    # выдача прав на папку
    TestScript = {
            $false
        }
        #
    SetScript = {
        $name = (Get-LocalGroup -SID S-1-5-32-545).name
        $Obj = Get-Item 'C:\ProgramData\sqldeveloper'
        $acl = Get-Acl $Obj
        if ($Obj.Mode -like 'd*----'){
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
        }
        if ($Obj.Mode -like '-*****'){
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name","Modify","Allow")
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
