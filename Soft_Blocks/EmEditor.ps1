# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{3D45BA74-9CCE-4EC1-8BDC-29B80BA6085A}"
# $SoftPath = $null
Package EmEditor_21_x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "EmEditor (64-bit)"
    Path = "\\server.domain.ru\SOFT\EmEditor\emed64_21.4.1.msi"
    ProductId = ""
    Arguments = '/quiet MSIINSTALLPERUSER=""'
}

# Проверка не предусмотрена
Registry EmEditor_21_x64_update{
    DependsOn = '[Package]EmEditor_21_x64'
    Key = "HKLM:\SOFTWARE\EmSoft\EmEditor v3\Common"
    ValueName = "CheckUpdates"
    Ensure = "Present"
    ValueData = '0'
    ValueType = "DWORD"
    Force = $true
}
