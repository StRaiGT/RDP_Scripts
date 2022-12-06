# Автоматическая установка
# Останавливает конвейер full_config (dsc вешается, помогает ручная перезагрузка)

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Common Files\Borland Shared\BDE\BDEADMIN.EXE"
Script Kliko{
    # DependsOn = '[]'
    TestScript = {
        $path_to_check = 'C:\Program Files (x86)\Common Files\Borland Shared\BDE\BDEADMIN.EXE'
        if (test-path $path_to_check -PathType Leaf){
            $true
        }else {
            $false
        }
    }
    SetScript = {
        New-Item "C:\Program Files (x86)\Common Files\Borland Shared\BDE\" -ItemType Directory
        Copy-Item -Path '\\server.domain.ru\SOFT\kliko\BDE_dll\*' -Destination 'C:\Program Files (x86)\Common Files\Borland Shared\BDE' -Force -Recurse
        Copy-Item -Path '\\server.domain.ru\SOFT\kliko\BDE_win\*' -Destination 'C:\Windows\SysWOW64' -Force -Recurse
        Start-Process "\\server.domain.ru\SOFT\kliko\bde_win_reg_dll.bat" -Wait -NoNewWindow
        Start-Process -filepath "C:\windows\regedit.exe" -argumentlist "/s \\server.domain.ru\SOFT\kliko\kliko_config.reg"
        Start-Process -filepath "\\server.domain.ru\SOFT\kliko\BDE_new\Setup.exe" -argumentlist "/s /sms" -Wait -NoNewWindow
        Copy-Item -Path '\\server.domain.ru\SOFT\kliko\IDAPI32.CFG' -Destination 'C:\Program Files (x86)\Common Files\Borland Shared\BDE\IDAPI32.CFG' -Force
    }
    GetScript = {
        # Do Nothing
    }
}
