# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "WinSCP 5.15.9"
# $SoftGuid = $null
# $SoftPath = $null
Package WinSCPx64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "WinSCP 5.15.9"
    Path = "\\server.domain.ru\SOFT\Ftp\WinSCP-5.15.9-Setup.exe"
    ProductId = ""
    Arguments = '/SILENT /ALLUSERS /NORESTART'
}
