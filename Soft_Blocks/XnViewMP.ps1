# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "XnViewMP 0.97.1"
# $SoftGuid = $null
# $SoftPath = $null
Package XnViewMP{
    # DependsOn = '[]'
    Name = 'XnViewMP 0.97.1'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\XnViewMP-win-x64_0.97.1.exe"
    Arguments = "/VERYSILENT /NORESTART"
    Ensure = 'Present'
}
