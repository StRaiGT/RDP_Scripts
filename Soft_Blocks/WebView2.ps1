# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = "Microsoft Edge WebView2 Runtime"
# $SoftGuid = $null
# $SoftPath = $null
Package WebView2{
    # name меняется от языка системы
    # Среда выполнения Microsoft Edge WebView2 Runtime
    # Microsoft Edge WebView2 Runtime

    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Microsoft Edge WebView2 Runtime"
    Path = "\\server.domain.ru\SOFT\MicrosoftEdgeWebView2RuntimeInstallerX64.exe"
    ProductId = ""
    Arguments = '/silent /install'
}
