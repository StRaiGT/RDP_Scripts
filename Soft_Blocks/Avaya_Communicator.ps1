# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Avaya one-X® Communicator"
# $SoftGuid = "{6D803607-F4C4-4FB0-8724-3CC1C90732DB}"
# $SoftPath = $null
Package Avaya_Communicator{
    # DependsOn = '[]'
    Name = 'Avaya one-X® Communicator'
    ProductId = '{6D803607-F4C4-4FB0-8724-3CC1C90732DB}'
    Path = "\\server.domain.ru\SOFT\One-X_Communicator\onexc_setup_6.1.9.04_132.msi"
    Arguments = '/qn'
    Ensure = 'Present'
}
