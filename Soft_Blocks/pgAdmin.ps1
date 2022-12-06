# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "pgAdmin 4 version 4.30"
# $SoftGuid = $null
# $SoftPath = $null
Package pgAdmin_4.30_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "pgAdmin 4 version 4.30"
    Path = "\\server.domain.ru\SOFT\pgAdmin\pgadmin4-4.30-x64.exe"
    ProductId = ""
    Arguments = '/VERYSILENT /NORESTART'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "pgAdmin 4 version 5.4"
# $SoftGuid = $null
# $SoftPath = $null
Package pgAdmin_4v5_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "pgAdmin 4 version 5.4"
    Path = "\\server.domain.ru\SOFT\pgAdmin\pgadmin4-5.4-x64.exe"
    ProductId = ""
    Arguments = '/ALLUSERS /VERYSILENT /NORESTART'
}
