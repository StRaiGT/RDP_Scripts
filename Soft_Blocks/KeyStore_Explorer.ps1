# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "KeyStore Explorer"
# $SoftGuid = $null
# $SoftPath = $null
Package KeyStore_Explorer{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "KeyStore Explorer"
    Path = "\\server.domain.ru\SOFT\KeyStore Explorer-544.exe"
    Arguments = "/S /AllUsers /D='C:\Program Files (x86)\KeyStore Explorer'"
    ProductId = ""
}
