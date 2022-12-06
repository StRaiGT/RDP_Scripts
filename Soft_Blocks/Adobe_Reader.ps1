# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Adobe Acrobat Reader 2017 MUI"
# $SoftGuid = "{AC76BA86-7AD7-FFFF-7B44-AE1108756300}"
# $SoftPath = "C:\Program Files (x86)\Adobe\Acrobat Reader 2017\Reader\AcroRd32.exe"
Package AcroRdr_2017{
    # DependsOn = '[]'
    Name = 'Adobe Acrobat Reader 2017 MUI'
    ProductId = '{AC76BA86-7AD7-FFFF-7B44-AE1108756300}'
    Path = "\\server.domain.ru\SOFT\AcroRdr20171700830051_MUI.exe"
    Arguments = "/sAll /rs /msi EULA_ACCEPT=YES"
    Ensure = 'Present'
}
