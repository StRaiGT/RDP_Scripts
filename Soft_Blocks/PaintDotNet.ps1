# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{6FED3D93-C0FA-4BD7-A36F-7FC53698244F}"
# $SoftPath = $null
Package PaintdotNet{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "paint.net"
    Path = "\\server.domain.ru\SOFT\PaintDotNet_x64.msi"
    ProductId = "{6FED3D93-C0FA-4BD7-A36F-7FC53698244F}"
    Arguments = '/qn'
}
