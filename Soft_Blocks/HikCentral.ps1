# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = "{D74979FF-25BB-4E43-8633-5E9D9C57FFF9}"
# $SoftPath = $null
Package HikCentral_distr{
    # DependsOn = '[]'
    Name = 'HikCentral Professional Control Client'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\HikCentral\HikCentral_Professional_Control_Client_V1.7.1.20201211_Win_x86_Installer.msi"
    Arguments = "/quiet /qn /norestart"
    Ensure = 'Present'
}

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\HikCentral\Client\lp.txt"
Script HikCentral_langpack{
    DependsOn = '[Package]HikCentral_distr'
    TestScript = {
        $test_path = 'C:\Program Files (x86)\HikCentral\Client\lp.txt'
        if (Test-Path $test_path -PathType Leaf){
            $true
        }else{
            $false
        }
    }
    SetScript = {
        New-Item -ItemType File -Path 'C:\Program Files (x86)\HikCentral\Client\lp.txt' -Force
        Copy-Item -Path '\\server.domain.ru\SOFT\HikCentral\LangPack\Client\MultiLanguagePlugin\MultiLanguagePlugin.xml' -Destination "C:\Program Files (x86)\HikCentral\Client\MultiLanguagePlugin.xml" -force
        Copy-Item -Path '\\server.domain.ru\SOFT\HikCentral\LangPack\Client\RemoteConfigTranslations\*' -Destination 'C:\Program Files (x86)\HikCentral\Client\RemoteConfig\translations' -force -Recurse
        Copy-Item -Path '\\server.domain.ru\SOFT\HikCentral\LangPack\Client\Translations\*' -Destination 'C:\Program Files (x86)\HikCentral\Client\translations' -force
    }
    GetScript = {
        # Do Nothing
    }
}
