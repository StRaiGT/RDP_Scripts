# Автоматическая установка
# Не тормозит конвейер
# Installing 75 minutes

# $SoftRegName = "Платформа SAP BusinessObjects BI 4.2 Средства клиента SP5"
# $SoftGuid = "{C862246F-423D-426B-AA61-9D4BAEB2037D}"
# $SoftPath = $null
Package SAP_BusinessObjects_step1_x32{
    # DependsOn = '[]'
    Ensure = "Present"
    Name = "Платформа SAP BusinessObjects BI 4.2 Средства клиента SP5"
    Path = "\\server.domain.ru\SOFT\SAP_BO\Step_1\setup.exe"
    ProductId = ""
    Arguments = '-r "\\server.domain.ru\SOFT\SAP_BO\Step_1\response_new.ini"'
}

# $SoftRegName = "Обновление Платформа SAP BusinessObjects BI 4.2, Средства клиента, SP5 Patch 2"
# $SoftGuid = "{D858B479-CB08-485A-A64A-A634C6780FCC.14.2.5.2}"
# $SoftPath = $null
Package SAP_BusinessObjects_step2_x32{
    DependsOn = '[Package]SAP_BusinessObjects_step1_x32'
    Ensure = "Present"
    Name = "Обновление Платформа SAP BusinessObjects BI 4.2, Средства клиента, SP5 Patch 2"
    Path = "\\server.domain.ru\SOFT\SAP_BO\Step_2\setup.exe"
    ProductId = ""
    Arguments = '-r "\\server.domain.ru\SOFT\SAP_BO\Step_2\response_new.ini"'
}

# $SoftRegName = "Обновление Платформа SAP BusinessObjects BI 4.2, Средства клиента, SP5 Patch 5"
# $SoftGuid = "{D858B479-CB08-485A-A64A-A634C6780FCC.14.2.5.5}"
# $SoftPath = $null
Package SAP_BusinessObjects_step3_x32{
    DependsOn = '[Package]SAP_BusinessObjects_step2_x32'
    Ensure = "Present"
    Name = "Обновление Платформа SAP BusinessObjects BI 4.2, Средства клиента, SP5 Patch 5"
    Path = "\\server.domain.ru\SOFT\SAP_BO\Step_3\setup.exe"
    ProductId = ""
    Arguments = '-r "\\server.domain.ru\SOFT\SAP_BO\Step_3\response_new.ini"'
}
