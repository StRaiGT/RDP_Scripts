# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "AdoptOpenJDK JDK with Hotspot 11.0.10+9 (x64)"
# $SoftGuid = "{E7AB7FCA-78F5-4B92-8326-AE97A09F74DD}"
# $SoftPath = "C:\Program Files\AdoptOpenJDK\jdk-11.0.10.9-hotspot\bin\java.exe"
Package adoptOpenJdk_11_hotspot{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "AdoptOpenJDK JDK with Hotspot 11.0.10+9 (x64)"
    Path = "\\server.domain.ru\SOFT\Adopt OpenJDK\OpenJDK11U-jdk_x64_windows_hotspot_11.0.10_9.msi"
    ProductId = "{E7AB7FCA-78F5-4B92-8326-AE97A09F74DD}"
    Arguments = 'INSTALLLEVEL=3 /quiet'
} 
