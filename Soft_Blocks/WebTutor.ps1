# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "WebTutor 2019.1.3 (Build:68)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\WebSoft\WebTutorAdmin\spxml.exe"
Package WebTutor{
    # DependsOn = '[]'
    Name = 'WebTutor 2019.1.3 (Build:68)'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\WebTutor 2019.1.3 (68) REL.exe"
    Arguments = '/verysilent /norestart'
    Ensure = 'Present'
}

# Проверка не предусмотрена
Script WebTutor_ACL{
    DependsOn = '[Package]WebTutor'
    TestScript = {
        $reg_path = 'HKLM:\SYSTEM\DSC_Config\WebTutor'
        if (Test-Path $reg_path){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        $name = (Get-LocalGroup -SID S-1-5-32-545).name
        # ACL для вложенных файлов и папок
        $Objects = Get-childItem "C:\Program Files\WebSoft\WebTutorAdmin" -Recurse
        foreach ($TempObj in $Objects){
            $Obj = $TempObj.FullName
            $acl = Get-Acl $Obj
            if ($TempObj.Mode -like 'd*----'){
                $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
            }
            if ($TempObj.Mode -like '-*****'){
                $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name","Modify","Allow")
            }
            $acl.SetAccessRule($accessRule)
            Set-Acl $Obj $acl
        }
        # ACL для корневой папки
        $Object = Get-Item "C:\Program Files\WebSoft\WebTutorAdmin"
        $acl = Get-Acl $Object
        $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\$name", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
        $acl.SetAccessRule($accessRule)
        $Fullname = $Object.FullName
        Set-Acl $Fullname $acl
        remove-item "C:\Program Files\WebSoft\WebTutorServer" -force -Recurse -confirm:$false
        New-Item -Path HKLM:\SYSTEM\DSC_Config\WebTutor -Force
    }
    GetScript = {
        # Do Nothing
    }
}
