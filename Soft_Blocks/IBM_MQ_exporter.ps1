# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "IBM MQ Explorer V9.1"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\IBM\WebSphere MQ Explorer\_IBM MQ Explorer V9.1_installation\Change IBM MQ Explorer V9.1 Installation.exe"
Package ibm_MQ_explorer{
    # DependsOn = '[]'
    Name = 'IBM MQ Explorer V9.1'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\IBM\MQExplorer\ms0t_mqexplorer_9100_windows_x86_64_new\Setup.exe"
    Arguments = "-f silent_install.resp"
    Ensure = 'Present'
}
