# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)
# Install in 40 minutes

# $SoftRegName = "Informatica 9.6.1 Client"
# $SoftGuid = $null
# $SoftPath = "C:\Informatica\9.6.1\clients\DeveloperClient\developer.exe"
Package Informatica_install{
    # DependsOn = '[]'
    Name = 'Informatica 9.6.1 Client'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\Informatica\Client\install.exe"
    Arguments = '-i silent -DINSTALL_MODE=SILENT'
    Ensure = 'Present'
}
