# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Sourcetree"
# $SoftGuid = "{3011B733-A639-4E0B-9D7C-F05C3740AC63}"
# $SoftPath = "C:\Program Files (x86)\Atlassian\Sourcetree\SourceTree.exe"
Package SourcetreeEnterprise{
    # DependsOn = '[]'
    Name = 'Sourcetree'
    ProductId = '{3011B733-A639-4E0B-9D7C-F05C3740AC63}'
    Path = "\\server.domain.ru\SOFT\SourcetreeEnterpriseSetup_3.3.9.msi"
    Arguments = 'ACCEPTEULA=1 /qn'
    Ensure = 'Present'
}
