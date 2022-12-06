# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Git version 2.29.1"
# $SoftGuid = $null
# $SoftPath = $null
Package Gitx64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Git version 2.29.1"
    Path = "\\server.domain.ru\SOFT\Git\Git-2.29.1-64-bit.exe"
    ProductId = ""
    Arguments = '/SP- /VERYSILENT /NORESTART'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Git Extensions 3.4.3.9999"
# $SoftGuid = "{9DA925A7-6D52-41F8-B91E-872C0FCC2E9D}"
# $SoftPath = $null
Package GitExtensions{
    # DependsOn = '[]'
    Name = 'Git Extensions 3.4.3.9999'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\GitExtensions-3.4.3.9999-d4b0f48bb.msi"
    Arguments = '/qn'
    Ensure = 'Present'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\GitHubDesktop\GitHubDesktop.exe"
File GitHubDesktop_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Git\GitHubDesktop"
    DestinationPath = "C:\Program Files\GitHubDesktop"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\GitHub Desktop.lnk"
File GitHubDesktop_lnk{
    DependsOn = '[File]GitHubDesktop_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Git\GitHub Desktop.lnk"
    DestinationPath = "C:\Users\Public\Desktop\GitHub Desktop.lnk"