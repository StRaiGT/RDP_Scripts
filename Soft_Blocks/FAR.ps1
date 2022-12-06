# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Far Manager 3 x64"
# $SoftGuid = "{9285E63A-5C9E-418C-AB01-C5172C307DC3}"
# $SoftPath = $null
Package FARx64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Far Manager 3 x64"
    Path = "\\server.domain.ru\SOFT\FAR\Far30b5354.x64.20190117.msi"
    ProductId = "{9285E63A-5C9E-418C-AB01-C5172C307DC3}"
    Arguments = 'ADDLOCAL=ALL /qn'
}
