# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "NetBeans IDE 7.0.1 RC1"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\NetBeans 7.0.1 RC1\bin\netbeans.exe"
Package NetBeans_7{
    # Need JDK 7u76x64
    # DependsOn = '[]'
    Name = 'NetBeans IDE 7.0.1 RC1'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\NetBeans\netbeans-7.0.1-ml-windows.exe"
    Arguments = "--silent"
    Ensure = 'Present'
}

Script NetBeans_7_config{
    # Подмена jdkhome на netbeans_jdkhome="C:\Program Files\Java\jdk1.7.0_76"
    DependsOn = '[Package]NetBeans_7'
    TestScript = {
        $false
    }
    SetScript = {
        Copy-Item -Path "\\server.domain.ru\SOFT\NetBeans\netbeans-7.0.1.conf" -Destination "C:\Program Files\NetBeans 7.0.1 RC1\etc\netbeans.conf" -Force
    }
    GetScript = {
        # Do Nothing
    }
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "NetBeans IDE 8.2"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\NetBeans 8.2\bin\netbeans.exe"
Package NetBeans_8{
    # Need JDK 8u121x64
    # DependsOn = '[]'
    Name = 'NetBeans IDE 8.2'
    ProductId = ''
    Path = "\\server.domain.ru\SOFT\NetBeans\netbeans-8.2-windows.exe"
    Arguments = "--silent"
    Ensure = 'Present'
}

Script NetBeans_8_config{
    # Подмена jdkhome на netbeans_jdkhome="C:\Program Files\Java\jdk1.8.0_121"
    DependsOn = '[Package]NetBeans_8'
    TestScript = {
        $false
    }
    SetScript = {
        Copy-Item -Path "\\server.domain.ru\SOFT\NetBeans\netbeans-8.2.conf" -Destination "C:\Program Files\NetBeans 8.2\etc\netbeans.conf" -Force
    }
    GetScript = {
        # Do Nothing
    }
}