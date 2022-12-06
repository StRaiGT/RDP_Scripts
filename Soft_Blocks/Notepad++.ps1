# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Notepad++ (64-bit x64)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Notepad++\notepad++.exe"
Package Notepad_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Notepad++ (64-bit x64)"
    Path = "\\server.domain.ru\SOFT\npp.7.8.8.Installer.x64.exe"
    ProductId = ""
    Arguments = '/S'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Notepad++\plugins\ComparePlugin\ComparePlugin.dll"
File Notepad_Plugin_Compare{
    DependsOn = '[Package]Notepad_x64'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Notepad++ plugin\"
    DestinationPath = "C:\Program Files\Notepad++\plugins\"
}
