# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Robo 3T 1.4.2"
# $SoftGuid = $null
# $SoftPath = $null
Package robo3t_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Robo 3T 1.4.2"
    Path = "\\server.domain.ru\SOFT\robo3t-1.4.2-windows-x86_64-8650949.exe"
    ProductId = ""
    Arguments = '/S'
}
