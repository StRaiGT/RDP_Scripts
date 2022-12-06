# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Tester 2.200"
# $SoftGuid = $null
# $SoftPath = $null
Package Tester{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = 'Tester 2.200'
    Path = "\\server.domain.ru\SOFT\Tester\tester2200.exe"
    ProductId = ''
    Arguments = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}
