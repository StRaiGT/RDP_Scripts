# Можно обновлять поверх старой версии

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{109CCDA4-00DC-440A-822B-967CCF889A25}"
# $SoftPath = $null
Package Node_js_16.14.2{
    # DependsOn = '[]'
    Name = 'Node.js'
    ProductId = '{109CCDA4-00DC-440A-822B-967CCF889A25}'
    Path = "\\server.domain.ru\SOFT\Node_js\node-v16.14.2-x64.msi"
    Arguments = '/qn /norestart'
    Ensure = 'Present'
}
