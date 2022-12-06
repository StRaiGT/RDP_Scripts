# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "FileZilla Client 3.38.1"
# $SoftGuid = $null
# $SoftPath = $null
Package FileZillax64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "FileZilla Client 3.38.1"
    Path = "\\server.domain.ru\SOFT\Ftp\FileZilla_Client_(64bit)_v3.38.1.exe"
    ProductId = ""
    Arguments = '/S'
}
