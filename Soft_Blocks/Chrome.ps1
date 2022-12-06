# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Google_v67\Chrome\Application\chrome_v67.exe"
File Chrome_v67_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\Google_v67\Google_v67"
    DestinationPath = "C:\Program Files (x86)\Google_v67"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\chrome_v67.lnk"
File Chrome_v67_lnk{
    DependsOn = '[File]Chrome_v67_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\Google_v67\chrome_v67.lnk"
    DestinationPath = "C:\Users\Public\Desktop\chrome_v67.lnk"
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Google_v78\Chrome\Application\chrome.exe"
File Chrome_v78_distr{
    # DependsOn = '[]'
    Ensure = "Present"
    Type = "Directory"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\Google_v78\Google_v78"
    DestinationPath = "C:\Program Files (x86)\Google_v78"
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Users\Public\Desktop\chrome_v78.lnk"
File Chrome_v78_lnk{
    DependsOn = '[File]Chrome_v78_distr'
    Ensure = "Present"
    Type = "File"
    Recurse = $true
    SourcePath = "\\server.domain.ru\SOFT\Browsers\Google_v78\chrome_v78.lnk"
    DestinationPath = "C:\Users\Public\Desktop\chrome_v78.lnk"
}

##################################################################################################################################

# Автоматическая установка
# Останавливает конвейер (требует перезагрузку)

# $SoftRegName = $null
# $SoftGuid = "{B24F0A95-6C38-3CA4-AFC8-7BDD38B8C51D}"
# $SoftPath = "C:\Program Files\Google\Chrome\Application\100.0.4896.60\chrome_pwa_launcher.exe"
Package Chrome_100{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Google Chrome"
    Path = "\\server.domain.ru\SOFT\Browsers\Chrome_new\googlechromestandaloneenterprise64_100.msi"
    ProductId = "{B24F0A95-6C38-3CA4-AFC8-7BDD38B8C51D}"
    Arguments = '/norestart'
}
