# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "S3 Browser version 8.9.5"
# $SoftGuid = $null
# $SoftPath = $null
Package s3browser{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "S3 Browser version 8.9.5"
    Path = "\\server.domain.ru\SOFT\s3browser-8-9-5.exe"
    ProductId = ""
    Arguments = '/VERYSILENT /NORESTART'
}
