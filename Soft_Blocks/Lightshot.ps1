# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Lightshot-5.2.1.1"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Skillbrains\lightshot\5.2.1.1\Lightshot.exe"
Package Lightshot{
    # DependsOn = '[]'
    Name = 'Lightshot-5.2.1.1'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\lightshot-5-2-1-1-multi-win.exe"
    Arguments = "/VERYSILENT /NORESTART"
    Ensure = 'Present'
}
