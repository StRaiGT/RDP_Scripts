# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "TortoiseGit 2.9.0.0 (64 bit)"
# $SoftGuid = "{E607B142-63C1-4602-9EB9-C8A2B9F162D6}"
# $SoftPath = $null
Package TortoiseGitx64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "TortoiseGit 2.9.0.0 (64 bit)"
    Path = "\\server.domain.ru\SOFT\Git\TortoiseGit-2.9.0.0-64bit.msi"
    ProductId = "{E607B142-63C1-4602-9EB9-C8A2B9F162D6}"
    Arguments = '/quiet'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "TortoiseSVN 1.12.0.28568 (64 bit)"
# $SoftGuid = "{35E59371-86FD-45FD-B318-549278DC0D0A}"
# $SoftPath = $null
Package TortoiseSVN{
    # DependsOn = '[]'
    Name = 'TortoiseSVN 1.12.0.28568 (64 bit)'
    ProductId = '{35E59371-86FD-45FD-B318-549278DC0D0A}'
    Path = "\\server.domain.ru\SOFT\TortoiseSVN-1.12.0.28568-x64-svn-1.12.0.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}
