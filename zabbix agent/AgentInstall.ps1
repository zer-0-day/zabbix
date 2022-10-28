[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
            
    #Подготовка конфига агента
    #Получить имя хоста
$ClienID = Get-ChildItem -Path "C:\Program Files\zabbix\" *.key | Select-Object BaseName
$ClienID.BaseName
    #замена partnerid на имя из файла .key
$FILE = Get-Content -Path "C:\Program Files\zabbix\conf\zabbix_agentd2.conf"
$NEWFILE = $FILE -replace 'partnerid', $ClienID.BaseName
$NEWFILE | Set-Content -Path "C:\Program Files\zabbix\conf\zabbix_agentd2.conf"
    #Установка агента
cmd.exe
"C:\Program Files\zabbix\bin\zabbix_agent2.exe" --c "C:\Program Files\zabbix\conf\zabbix_agentd2.conf" --install
exit
"Создайте новый узел сети на сервере Zabbix, затем продолжите работу установщика"

Start-Service zab*
Get-Service zab*
timeout.exe /T 20
Stop-Service zab*
Start-Service zab*
Get-Service zab*
Get-Content -Path "C:\Program Files\zabbix\zabbix_agentd.log"
Pause

