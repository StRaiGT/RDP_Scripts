# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "PuTTY release 0.74 (64-bit)"
# $SoftGuid = "{127B996B-5308-4012-865B-9446451EA326}"
# $SoftPath = $null
Package PuTTY_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "PuTTY release 0.74 (64-bit)"
    Path = "\\server.domain.ru\SOFT\putty-64bit-0.74-installer.msi"
    ProductId = "{127B996B-5308-4012-865B-9446451EA326}"
    Arguments = '/qn'
}
