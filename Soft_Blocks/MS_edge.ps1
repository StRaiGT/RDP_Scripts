# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Microsoft Edge"
# $SoftGuid = "{04D00D5B-67FB-32B4-8D2E-13BED1C029FA}"
# $SoftPath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
Package MS_Edge{
    # DependsOn = '[]'
    Name = 'Microsoft Edge'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\Browsers\MicrosoftEdgeEnterpriseX64.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}
