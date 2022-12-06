# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Offset Explorer 2 2.1"
# $SoftGuid = $null
# $SoftPath = $null
Package offsetexplorer_64bit{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Offset Explorer 2 2.1"
    Path = "\\server.domain.ru\SOFT\offsetexplorer\offsetexplorer_64bit.exe"
    ProductId = ""
    Arguments = '-q /NORESTART'
}      
