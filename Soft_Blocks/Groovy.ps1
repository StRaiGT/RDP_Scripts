# Автоматическая установка
# Не тормозит конвейер

# $SoftRegName = "Groovy-2.5.5"
# $SoftGuid = $null
# $SoftPath = "C:\Program Files (x86)\Groovy\Groovy-2.5.5\bin\groovy.exe"
Package Groovy{
    # Need jre
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Groovy-2.5.5"
    Path = "\\server.domain.ru\SOFT\groovy-2.5.5-installer.exe"
    ProductId = ""
    Arguments = '/S /ALL /V /N /F /D=C:\Program Files (x86)\Groovy\Groovy-2.5.5'
}

# Проверка не предусмотрена
Environment Env_for_Groovy_Java_Home{
    DependsOn = '[Package]Groovy'
    Name = 'JAVA_HOME'
    Path = $false
    Value = "C:\Program Files (x86)\Java\jre1.8.0_211"
    Ensure = 'Present'
}
