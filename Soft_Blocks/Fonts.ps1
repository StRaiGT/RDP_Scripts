# Автоматическая установка
# Не тормозит конвейер

# Проверка не предусмотрена
Script Fonts{
    ## install -> reboot host for applying change in registry ##
    # DependsOn = '[]'
    TestScript = {
        $false
    }
    SetScript = {
        $fontFolder = "\\server.domain.ru\SOFT\Fonts"
        $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
        foreach ($font in Get-ChildItem -Path $fontFolder -Include *.ttf, *.otf -Recurse -File) {
            $fontName = $font.name
            if (Test-Path -Path "C:\Windows\Fonts\$fontName") {
                #"Font $fontName already installed."
            }
            else {
                $font | Copy-Item -Destination "C:\Windows\Fonts"
                $FontType = switch ($font.extension) {
                    ".otf" {"(Open Type)"}
                    ".ttf" {"(True Type)"}
                }
                $regKeyName = $font.baseName,$FontType -join " "
                New-ItemProperty -Path $regPath -Name $regKeyname -Value $fontName -PropertyType String -Force | Out-Null
                #"Complete installing font $fontName."
            }
        }
    }
    GetScript = {
        # Do Nothing
    }
}
