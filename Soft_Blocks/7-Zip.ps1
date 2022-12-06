# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "7-Zip 19.00 (x64 edition)"
# $SoftGuid = "{23170F69-40C1-2702-1900-000001000000}"
# $SoftPath = $null
Package ZipInstall{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "7-Zip 19.00 (x64 edition)"
    Path = "\\server.domain.ru\SOFT\Archivators\7z1900-x64.msi"
    ProductId = "{23170F69-40C1-2702-1900-000001000000}"
    Arguments = '/norestart'
}
