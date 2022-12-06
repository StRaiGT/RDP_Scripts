# Можно обновлять поверх старой версии

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Insomnia\app-2022.2.1\Insomnia.exe"
File Insomnia_2022.2.1{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Insomnia\Insomnia_2022.2.1"
    DestinationPath = "C:\Insomnia"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\Insomnia.lnk"
File Insomnia_lnk{
    DependsOn = '[File]Insomnia_2022.2.1'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Insomnia\Insomnia.lnk"
    DestinationPath = "C:\Users\Public\Desktop\Insomnia.lnk"
}
