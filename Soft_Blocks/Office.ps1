# Old version
# Not tested
Package MS_Office_2019_Pro{
    # DependsOn = ''
    Ensure = "Present"
    Name = "Microsoft Office Professional Plus 2019 - ru-ru"
    Path = "\\server.domain.ru\SOFT\MS_Office\Office_2019_Pro\setup.exe"
    ProductId = ""
    Arguments = '/configure "\\server.domain.ru\SOFT\MS_Office\Office_2019_Pro\Pro_withoutOutlook.xml"'
}
##################################################################################################################################

# Удаляет все что связано с MS Office, включая Visio и Project
Script Office_2019_Pro_Uninstall{
    # DependsOn = ''
    TestScript = {
        $false
    }
    SetScript = {
        Start-Process -FilePath "\\server.domain.ru\SOFT\MS_Office\Office_2019_Pro\Uninstall.bat" -Wait
    }
    GetScript = {
        # Do Nothing
    }
}
##################################################################################################################################

# Можно обновлять поверх старой версии

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Microsoft Office Professional Plus 2019 - en-us"
# $SoftGuid = $null
# $SoftPath = $null

# $SoftRegName = "Microsoft Visio Professional 2019 - en-us"
# $SoftGuid = $null
# $SoftPath = $null

# $SoftRegName = "Microsoft Project Professional 2019 - en-us"
# $SoftGuid = $null
# $SoftPath = $null

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Microsoft Office\root\Office16\Outlook.exe"
Package MS_Office_2019_Pro_RU-EN{
    # Ставит Office 2019 ProPlus без Outlook + Project Pro 2019 + Visio Pro 2019
    # Весь софт с RU и EN интерфейсами
    # DependsOn = ''
    Ensure = "Present"
    Name = "Microsoft Office Professional Plus 2019 - en-us"
    Path = "\\server.domain.ru\SOFT\MS_Office\Office_2019\setup.exe"
    ProductId = ""
    Arguments = '/configure "\\server.domain.ru\SOFT\MS_Office\Office_2019\Pro_withoutOutlook.xml"'
}
