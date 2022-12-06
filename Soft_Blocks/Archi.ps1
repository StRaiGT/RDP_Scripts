# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Archi 4.6.0"
# $SoftGuid = "{17490178-4BB9-40A0-A9C4-F82027FF49B8}_is1"
# $SoftPath = $null
Package Archi_4.6.0{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Archi 4.6.0"
    Path = "\\server.domain.ru\SOFT\Archi-Win64-Setup-4.6.0-beta2.exe"
    ProductId = ""
    Arguments = '/VERYSILENT /NORESTART'
}
