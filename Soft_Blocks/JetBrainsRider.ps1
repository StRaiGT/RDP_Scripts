# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "JetBrains Rider 2021.3.4"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\JetBrains\JetBrains.Rider 2021.3.4\bin\rider64.exe"
Package JetBrainsRider_2021.3.4{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "JetBrains Rider 2021.3.4"
    Path = "\\server.domain.ru\SOFT\Jetbrains\Rider\JetBrains.Rider-2021.3.4.exe"
    ProductId = ""
    Arguments = '/S /CONFIG=\\server.domain.ru\SOFT\Jetbrains\JetBrains-Conf\silent.config /D=C:\Program Files\JetBrains\JetBrains.Rider 2021.3.4'
}
