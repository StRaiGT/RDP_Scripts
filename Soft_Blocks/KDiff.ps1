# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "KDiff3 (remove only)"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\KDiff3\kdiff3.exe"
Package KDiff3{
    # DependsOn = '[]'
    Name = 'KDiff3 (remove only)'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\KDiff3-64bit-Setup_0.9.98-2.exe"
    Arguments = "/S"
    Ensure = 'Present'
}
