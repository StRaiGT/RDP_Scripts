# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "Microsoft SQL Server Management Studio - 18.8"
# $SoftGuid = "{9523f5f8-19f1-47d8-928c-358505ab129d}"
# $SoftPath = $null
Package ssms{
    # DependsOn = '[]'
    Ensure = 'Present'
    Name = 'Microsoft SQL Server Management Studio - 18.8'
    ProductId = '{9523f5f8-19f1-47d8-928c-358505ab129d}'
    Path = "\\server.domain.ru\SOFT\SSMS-Setup-RUS.exe"
    Arguments = '/install /quiet /norestart'
}
