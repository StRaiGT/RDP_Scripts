# Not tested

Script Photo_Viewer_On{
    # DependsOn = '[]'
    TestScript = {
        $false
    }
    SetScript = {
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll" -ItemType RegistryKey -Force
        }
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell" -ItemType RegistryKey -Force
        }
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open" -ItemType RegistryKey -Force
        }
        Set-ItemProperty -path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open" -Name "MuiVerb" -Type "String" -Value "@photoviewer.dll,-3043"
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\command")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\command" -ItemType RegistryKey -Force
        }
        Set-ItemProperty -path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\command" -Name "(Default)" -Type "ExpandString" -Value "%SystemRoot%\System32\rundll32.exe `"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll`", ImageView_Fullscreen %1"
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget" -ItemType RegistryKey -Force
        }
        Set-ItemProperty -path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget" -Name "Clsid" -Type "String" -Value "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print" -ItemType RegistryKey -Force
        }
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command" -ItemType RegistryKey -Force
        }
        Set-ItemProperty -path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command" -Name "(Default)" -Type "ExpandString" -Value "%SystemRoot%\System32\rundll32.exe `"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll`", ImageView_Fullscreen %1"
        If  ( -Not ( Test-Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\DropTarget")){
            New-Item -Path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\DropTarget" -ItemType RegistryKey -Force
        }
        Set-ItemProperty -path "Registry::HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\DropTarget" -Name "Clsid" -Type "String" -Value "{60fd46de-f830-4894-a628-6fa81bc0190d}"
    }
    GetScript = {
        # Do Nothing
    }
}
#
#
# Альтернативный вариант
Registry EnablePhotoviewe-Step1{
    # DependsOn = '[]'
    Ensure = "Present"
    Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open"
    ValueName = "MuiVerb"
    ValueData = "@photoviewer.dll,-3043"
    ValueType = "String"
    Force = $true
}
Registry EnablePhotoviewe-Step2{
    DependsOn = '[Registry]EnablePhotoviewe-Step1'
    Ensure = "Present"
    Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\open\DropTarget"
    ValueName = "Clsid"
    ValueData = "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
    ValueType = "String"
    Force = $true
}
Registry EnablePhotoviewe-Step3{
    DependsOn = '[Registry]EnablePhotoviewe-Step2'
    Ensure = "Present"
    Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\command"
    ValueName = ""
    ValueData = '%SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %1'
    ValueType = "ExpandString"
    Force = $true
}
Registry EnablePhotoviewe-Step4{
    DependsOn = '[Registry]EnablePhotoviewe-Step3'
    Ensure = "Present"
    Key = "HKEY_CLASSES_ROOT\Applications\photoviewer.dll\shell\print\DropTarget"
    ValueName = "Clsid"
    ValueData = '{60fd46de-f830-4894-a628-6fa81bc0190d}'
    ValueType = "String"
    Force = $true
}
