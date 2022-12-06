# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Kreya"
# $SoftGuid = "{17B52E85-8D8C-4CD9-A917-0BEBC53D2D5E}"
# $SoftPath = $null
Package Kreya{
    # Для установки требуется Microsoft Edge WebView2
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Kreya"
    Path = "\\server.domain.ru\SOFT\Kreya-win.msi"
    ProductId = "{17B52E85-8D8C-4CD9-A917-0BEBC53D2D5E}"
    Arguments = '/quiet /norestart'
}
