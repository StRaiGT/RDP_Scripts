# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "VMware Remote Console"
# $SoftGuid = "{6060CDE5-31FC-4F96-AC57-8775D28ABE3E}"
# $SoftPath = "C:\Program Files (x86)\VMware\VMware Remote Console\vmrc.exe"
Package VMware-VMRC{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "VMware Remote Console"
    Path = "\\server.domain.ru\SOFT\VMware-VMRC-12.0.0-17287072.exe"
    ProductId = ""
    Arguments = '/s /v /qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 DATACOLLECTION=0'
}