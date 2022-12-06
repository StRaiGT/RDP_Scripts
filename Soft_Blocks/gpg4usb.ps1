# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\gpg4usb-0.3.3-2\start_windows.exe"
File gpg4usb_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\gpg4usb\gpg4usb-0.3.3-2"
    DestinationPath = "C:\gpg4usb-0.3.3-2"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\gpg4usb-0.3.3-2.lnk"
File gpg4usb_lnk{
    DependsOn = '[File]gpg4usb_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\gpg4usb\gpg4usb-0.3.3-2.lnk"
    DestinationPath = "C:\Users\Public\Desktop\gpg4usb-0.3.3-2.lnk"
}
