# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Sublime Text 3"
# $SoftGuid = $null
# $SoftPath = $null
Package Sublime_Text_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Sublime Text 3"
    Path = "\\server.domain.ru\SOFT\Sublime Text Build 3207 x64 Setup.exe"
    ProductId = ""
    Arguments = '/VERYSILENT /NORESTART'
}
