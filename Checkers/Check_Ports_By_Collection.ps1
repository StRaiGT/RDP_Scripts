# Скрипт используется для массовой проверки доступов до ресурсов со всех хостов терминальной коллекции
# В результате отчёт будет выведен в консоль

# Задаём начальные настройки
$FirstBroker = "broker.domain.ru"
$Collection = "CollectionName"

# Получаем список хостов коллекции
$ActiveBroker = (Get-RDConnectionBrokerHighAvailability -ConnectionBroker $FirstBroker).ActiveManagementServer
$Machine = @()
$Machine += (Get-RDSessionHost -ConnectionBroker $ActiveBroker -CollectionName $Collection).SessionHost -join "`n"
$Machine = $Machine -split "`n"
"`nHosts count: " + $Machine.Count

# Инициализируем проверку по полученным хостам (с выгрузкой в консоль)
"`nHostName`tTargetName`t`tPort`tStatus"
Invoke-command -computer $Machine{
#   # Указываем перечень проверяемых доступов в формате "host.domen.ru PortNumber"
    $TestInfo = @()
    $TestInfo = "host1.domain.ru 8080
    host1.domain.ru 443
    host2.domain.ru 8080
    host2.domain.ru 443"
    $TestInfo = ($TestInfo -split "`n").trim()

#   # Проверка и вывод результата
    foreach($TestPath In $TestInfo){
        $TestResource = @()
        $TestPath = $TestPath -split "`n"
        $TestResource = $TestPath -split " "
        $out = $ENV:COMPUTERNAME + "`t" + $TestResource[0] + "`t" + $TestResource[1] + "`t" + (Test-NetConnection $TestResource[0] -Port $TestResource[1] -WarningAction SilentlyContinue -InformationLevel Quiet)
        Write-Host $out
    }
}
"Finish scanning !`n"
