# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java SE Development Kit 7 Update 76 (64-bit)"
# $SoftGuid = "{64A3A4F4-B792-11D6-A78A-00B0D0170760}"
# $SoftPath = "C:\Program Files\Java\jdk1.7.0_76"
Package jdk-7u76x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java SE Development Kit 7 Update 76 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jdk-7u76-windows-x64.exe"
    ProductId = "{64A3A4F4-B792-11D6-A78A-00B0D0170760}"
    Arguments = 'INSTALL_SILENT=Enable'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java SE Development Kit 8 Update 121"
# $SoftGuid = "{32A3A4F4-B792-11D6-A78A-00B0D0180121}"
# $SoftPath = "C:\Program Files (x86)\Java\jdk1.8.0_121"
Package jdk-8u121x32{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java SE Development Kit 8 Update 121"
    Path = "\\server.domain.ru\SOFT\java\jdk-8u121-windows-i586.exe"
    ProductId = "{32A3A4F4-B792-11D6-A78A-00B0D0180121}"
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java SE Development Kit 8 Update 121 (64-bit)"
# $SoftGuid = "{64A3A4F4-B792-11D6-A78A-00B0D0180121}"
# $SoftPath = "C:\Program Files\Java\jdk1.8.0_121"
Package jdk-8u121x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java SE Development Kit 8 Update 121 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jdk-8u121-windows-x64.exe"
    ProductId = "{64A3A4F4-B792-11D6-A78A-00B0D0180121}"
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java(TM) SE Development Kit 11.0.6 (64-bit)"
# $SoftGuid = "{FB40F6A5-6A0A-5685-8579-2605295B7BFD}"
# $SoftPath = "C:\Program Files\Java\jdk-11.0.6"

Package jdk-11.0.6x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java(TM) SE Development Kit 11.0.6 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jdk-11.0.6_windows-x64_bin.exe"
    ProductId = ""
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java(TM) SE Development Kit 13.0.1 (64-bit)"
# $SoftGuid = "{02E6B6AF-D69D-5191-9D34-7E11D4AC952C}"
# $SoftPath = "C:\Program Files\Java\jdk-13.0.1"
Package jdk-13_0_1x64{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java(TM) SE Development Kit 13.0.1 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jdk-13.0.1_windows-x64_bin.exe"
    ProductId = ""
    Arguments = 'INSTALL_SILENT=Enable'
}
##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Java(TM) SE Development Kit 17.0.1 (64-bit)"
# $SoftGuid = "{7ECAAC8F-FBBE-5265-BBF4-0AC48139FB26}"
# $SoftPath = "C:\Program Files\Java\jdk-17.0.1"
Package jdk-17.0.1x64{
    # НЕ СТАВИТЬ ЭТУ БАГОВАННУЮ ВЕРСИЮ
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Java(TM) SE Development Kit 17.0.1 (64-bit)"
    Path = "\\server.domain.ru\SOFT\java\jdk-17.0.1_windows-x64_bin.msi"
    ProductId = ""
    Arguments = 'INSTALL_SILENT=Enable'
}

##################################################################################################################################

# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = $null
# $SoftGuid = $null
# $SoftPath = "C:\Program Files\Java\jdk-17.0.2"
Script jdk-17.0.2x64{
    ## NO change in PATH - NO need restart ##
    # DependsOn = '[]'
    TestScript = {
        $path_install = "C:\Program Files\Java\jdk-17.0.2"
        if (test-path $path_install){
            Write-Verbose 'JDK - FOUND'
            $true
        }else {
            Write-Verbose 'JDK - INSTALL IN PROCESS'
            $false
        }
    }
    SetScript = {
        $path_install = "C:\Program Files\Java\jdk-17.0.2"
        New-Item -ItemType Directory $path_install -force | Out-Null
        Copy-Item -Path "\\server.domain.ru\SOFT\java\jdk-17.0.2_windows-x64_bin\*" -Destination $path_install -Recurse -Force
    }
    GetScript = {
        # Do Nothing
    }
}
