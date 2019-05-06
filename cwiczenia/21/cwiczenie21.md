# Cwiczenie 21

## Cel

Ćwiczenie ma na celu pokazanie w jaki sposób można monitorować systemy z użyciem nmon i njmon. Dzięki temu cwiczeniu dowiesz się jak używać nmona i njmona. Dowiesz się jak w prosty sposób zintegrować je z grafaną. W ćwiczeniu do przechowywania danych używamy InfluxDB. Więcej na temat InfluxDB mozna znaleźć w dokumentacji (https://docs.influxdata.com/influxdb/v1.7/).


## Wstęp
Nmon to narzędzie, które jeste częścią systemu operacyjnego AIX. Mamy też implementacje dla różnych wersji Linuxa. Narzędzie zostało napisane w języku C i jest dostępne na wiele platform: PSeries, Intel/AMD, i386/x86_64. Więcej informacji możecie znaleźć na stronie: http://nmon.sourceforge.net/pmwiki.php?n=Site.Njmon.
Nmon dał początek nowemu narzędziu a mianowicie njmon. Można powiedzieć, że NJMON to taka nowoczesna wersja NMONA. NJMON zapisuje
w notacji json więc bardzo łatwo zintegrować go z pythonem. Można przyjąć, że NJMON to narzędzie, któremu bliżej do zapisu w czasie rzeczywistym.

## Wymagane elementy

+ subkatalog repozytorium "vagrant":

```
.
|-- README.md
|-- secure
|   |-- id_rsa_vagrant
|   `-- id_rsa_vagrant.pub
|-- src
|   |-- etc
|   |   `-- hosts
|   |-- grafana
|   |   `-- grafana-dashboards.sh
|   |-- keys
|   |   |-- id_rsa
|   |   `-- id_rsa.pub
|   |-- njmon
|   |   |-- custom
|   |   |   |-- njmon-collector.service
|   |   |   |-- root.cron
|   |   |   |-- start-njmon-c.sh
|   |   |   `-- stop-njmon-c.sh
|   |   |-- dashboards
|   |   |   |-- NJMON-externally-Linux.json
|   |   |   `-- NJMON-internal-CRC-Linux.json
|   |   |-- njmon_collector_x86_ubuntu1804_v16
|   |   |-- njmon_linux_x86_rhel75_v22
|   |   `-- njmon_to_InfluxDB_injector_15.py
|   |-- nmon
|   |   |-- client
|   |   |   `-- nmon16h_x86_rhel7
|   |   |-- custom
|   |   |   |-- keys
|   |   |   |   |-- id_rsa
|   |   |   |   `-- id_rsa.pub
|   |   |   |-- root-client.cron
|   |   |   `-- root-importer.cron
|   |   `-- importer
|   |       |-- lab.lst
|   |       |-- nmon2influxdb
|   |       |-- nmon_importer
|   |       `-- nmon_import_slack.py
|   `-- scripts
|       `-- provisioning
|           |-- grafana.sh
|           |-- hosts.sh
|           |-- influxdb.sh
|           |-- njmon-client.sh
|           |-- njmon-collector.sh
|           |-- nmon-client.sh
|           |-- nmon-collector.sh
|           |-- node-exporter.sh
|           |-- prometheus.sh
|           `-- root-ssh-access.sh
`-- Vagrantfile

15 directories, 36 files

```

+ maszyny Vagrant:
  * vm-grafana
  * vm-influxdb
  * vm-njmon
  * vm-nmon
  * vm1-os
  * vm2-os
  * vm3-os
  * vm4-os
  * vm5-os
  * vm6-os

+ pakiety:


## Uruchomienie środowiska

[Instrukcja jak wystartować laboratorium](https://github.ibm.com/CRC/docker-monitoring/blob/master/vagrant/README.md)


## Implementacja dahsboardu dla nmon'a
Z katalogu cwiczenia/cwiczenie21/scripts skopiuj i uruchom skrypt linux-nmon.sh (copy paste z githuba):
```
./linux-nmon.sh
Create dashboard - Linux NMON CRC

{"id":1,"slug":"linux-servers-nmon","status":"success","uid":"He1zkDRWz","url":"/d/He1zkDRWz/linux-servers-nmon","version":1}
```

W przeglądarce otwórz następujący link: http://localhost:3000
Zaloguj się do Grafany urzywając następujących danych: admin:crc2019. Po otworzeniu Dashboardu `Linux Server NMON` powinna zostać wyświetlone następujące dane:

![](src/cwiczenie-1.jpg "")

Jak widzicie brakuje nam plugina odpowiadającego za wyświetlanie wykresów kołowych. Należy go zainstalować. Jak to zrobić? Odysłam was do ćwiczenia 4 z 1 sesji.

lub https://grafana.com/plugins/grafana-piechart-panel

Aby móc zainstalować plugin w grafanie musimy najpierw połączyć się do maszyny vm-grafana używając vagranta.

```
vagrant ssh vm-grafana
sudo su - grafana
```

![](src/think.gif "") Pamiętajcie by wszystkie polecenia wykonywać w ~/part-repo-vagrant/vagrant

Zapewne nie możecie się zalogować? Jak wyczerpiecie już wszystkie pomysły i poddacie się zapytajcie instruktora ;-)

Instalujemy plugin:

```
installing grafana-piechart-panel @ 1.3.6
from url: https://grafana.com/api/plugins/grafana-piechart-panel/versions/1.3.6/download
into: /var/lib/grafana/plugins

✔ Installed grafana-piechart-panel successfully

Restart grafana after installing plugins . <service grafana-server restart>
```

Jak widać instalacja wymaga restartu. Zrestartujcie serwis grafany (nazwa serwisu to grafana-server).

Logujemy się do grafany i sprawdzamy rezultaty:

![](src/cwiczenie-2.jpg "")

Super! Czerwony banner zniknął, udało się!

## Implementacja loadera

Aby móc w pełni cieszyć się wykresami musimy zaimplementować mechanizm zasilania bazy danych. Jak nazywa się wasz data source wiecie? Co to za typ bazy? Jak zweryfikować czy działa?

Uzywając ```vagrant ssh``` zaloguj się do maszyny vm-nmon. Kolejno przełączamy się na użytkownika root.

Wylistuj zawartość cron (użytkownik root):

```
[root@vm-nmon ~]# crontab -l
# NMON import files into InfluxDB:
*/5   *   *   *   *   /bin/bash -l -c 'source ~/.bash_profile;source ~/.bashrc;/usr/local/nmon-import/bin/nmon_importer' > /dev/null 2>&1
```

Uruchom skrypt manualnie:

```
/bin/bash -l -c 'source ~/.bash_profile;source ~/.bashrc;/usr/local/nmon-import/bin/nmon_importer' > /dev/null 2>&1
```

W oknie przeglądarki odśwież stronę. Czy widać zmiany?
Jeżeli nie to czemu? Teraz mamy chwilę na trouble shooting.

Przeanalizuj skrypt by znaleźć miejsce składowania logów.

Log będzie zawierał takie komunikaty:
```
****************************
*** DB IMPORT LINUX DATA ***
****************************
Following file will be imported to InfluxDB:
processing...
file not changed since last import: /nmons/vm3-os/vm3-os_190410_0815.nmon
-------------------------------------------------------------------------
*******************************
*** DOWNLOAD NMON FILES LAB ***
*******************************
****************************
*** DB IMPORT LINUX DATA ***
****************************
Following file will be imported to InfluxDB:
processing...
file not changed since last import: /nmons/vm3-os/vm3-os_190410_0815.nmon
-------------------------------------------------------------------------
```

Czemu tak jest? Spróbujmy to naprawić.

Otwórz kolejną sesje terminala i używając ```vagrant ssh``` zaloguj się do maszyny
vm3-os oraz vm4-os. Przełącz się na root używając komendy ```sudo su -```. Wylistuj zawartość cron dla użytkownika root:

```
crontab -l
```

Komenda powinna zwrócić następujące wpisy:

```
# crontab -l
# nmon data collection and housekeeping
0 0 * * * /usr/local/bin/nmon -f -s 30 -c 2880 -T -N -I 0.1 -m /etc/perf/daily/ >/dev/null 2>&1
5 0 * * * /usr/bin/find /etc/perf/daily -name "*.nmon" -mtime +1 -exec gzip -9 {} \;
59 23 * * * /usr/bin/find /etc/perf/daily -name "*.nmon*" -mtime +30 -exec rm {} \;
```

Zweryfikujmy czy nmon został uruchomiony:

```
# ps -ef | grep -i [n]mon
#
```

Niestety nie działa. Korzystając z crontaba uruchamiamy nmona:

```
# /usr/local/bin/nmon -f -s 30 -c 2880 -T -N -I 0.1 -m /etc/perf/daily/ >/dev/null 2>&1
# ps -ef | grep -i [n]mon
root     10072     1  0 13:48 pts/0    00:00:00 /usr/local/bin/nmon -f -s 30 -c 2880 -T -N -I 0.1 -m /etc/perf/daily
```

Wykonaj tą operacje na 2 maszynach vm3-os i vm4-os.

Odczekaj 5 minut a następnie zaloguj się do vm-nmon, następnie ponownie zweryfikuj log skryptu:

```
# pwd
/usr/local/nmon-import/logs
[root@vm-nmon logs]# ls -la
total 384
drwxr-xr-x. 2 root root     33 Apr 10 07:50 .
drwxr-xr-x. 5 root root     54 Apr 10 07:45 ..
-rw-r--r--. 1 root root 153124 Apr 11 13:51 lab_run_current.out
```

Na samym końcu w pliku powinny zlaleźć się następujące linie:
```
*******************************
*** DOWNLOAD NMON FILES LAB ***
*******************************
vm3-os
vm3-os_190411_1348.nmon
Starting download procedure: 2019-04-11_14:00:01
Downloading file:
++++++++++++++++++++++++++++++++++++
Filename downloaded: vm3-os_190411_1348.nmon
Check file modification:
2019-04-11 13:59:54.504344606 +0000
====================================
vm4-os
vm4-os_190411_1356.nmon
Starting download procedure: 2019-04-11_14:00:01
Downloading file:
++++++++++++++++++++++++++++++++++++
Filename downloaded: vm4-os_190411_1356.nmon
Check file modification:
2019-04-11 13:59:40.172293096 +0000
====================================
****************************
*** DB IMPORT LINUX DATA ***
****************************
Following file will be imported to InfluxDB: vm3-os_190411_1348.nmon
processing...

File /nmons/vm3-os/vm3-os_190411_1348.nmon imported : 2415 points !
-------------------------------------------------------------------------
Following file will be imported to InfluxDB: vm4-os_190411_1356.nmon
processing...

File /nmons/vm4-os/vm4-os_190411_1356.nmon imported : 857 points !
-------------------------------------------------------------------------
*******************************
*** DOWNLOAD NMON FILES LAB ***
*******************************
vm3-os
vm3-os_190411_1348.nmon
Starting download procedure: 2019-04-11_14:02:04
Downloading file:
++++++++++++++++++++++++++++++++++++
Filename downloaded: vm3-os_190411_1348.nmon
Check file modification:
2019-04-11 14:01:54.571190539 +0000
====================================
vm4-os
vm4-os_190411_1356.nmon
Starting download procedure: 2019-04-11_14:02:04
Downloading file:
++++++++++++++++++++++++++++++++++++
Filename downloaded: vm4-os_190411_1356.nmon
Check file modification:
2019-04-11 14:01:40.240130856 +0000
====================================
****************************
*** DB IMPORT LINUX DATA ***
****************************
Following file will be imported to InfluxDB: vm3-os_190411_1348.nmon
processing...

File /nmons/vm3-os/vm3-os_190411_1348.nmon imported : 533 points !
-------------------------------------------------------------------------
Following file will be imported to InfluxDB: vm4-os_190411_1356.nmon
processing...

File /nmons/vm4-os/vm4-os_190411_1356.nmon imported : 554 points !
-------------------------------------------------------------------------

```

UWAGA!
`Jeżeli z jakiegoś powodu serwis InfluxDB nie odpowiada zrestartuj go.`

```
vagrant ssh vm-influxdb
sudo su -
systemctl restart influxdb
```

Po chwili nasze wykresy powinny wygladać:

![](src/cwiczenie-3.jpg "")

Jeżeli dane w dashboard z jakiegoś powodu nie są widoczne, jeszcze raz przeanalizuj wszystkie kroki. Być może, któryś został pominięty.

## Stress testy

### Instalacja narzędzia stress
Przy użyciu `vagrant ssh` zaloguj się do 2 testowych maszyn (vm3-os, vm4-os). Zainstaluj repozytorium epel:
```
vagrant-ssh (vm3-os/vm4-os)
sudo su -
yum install -y epel-release
yum install -y stress

Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
.
..
...
Installed:
  epel-release.noarch 0:7-11                                                                                                                                                                  

Complete!
```

Zainstaluj narzedzie stress:
```
yum install -y stress
```

### Stress testy

Przeprowadzamy stress testy zgodnie z poniższymi zaleceniami:

Na maszynie vm3-os uruchamiamy narzędzie stress tak aby zająć 90% pamięci. Stress test ma trwać 10 minut. Przed rozpoczęciem testu
zweryfikuj zużycie pamięci. Możesz do tego celu użyć narzędzia nmon lub polecenia free. W moim przypadku polecenie do stress testu wygląda następująco:

```
# stress --cpu 1 --io 4 --vm 1 --vm-bytes 5M --timeout 600s
```

Wartości dla poszczególnych zmiennych mogą się różnić w zależności od wykorzystania pamięci w twoim systemie. `Bądź ostrożny przy nadawaniu wartości dla zmiennej vm-bytes. Błędne oszacowanie i nadanie zbyt dużej wartości może spowodować, że maszyna przestanie odpowiadać!`

Na maszynie vm4-os uruchamiamy narzędzie stress tak aby zajętość procesora wynosiła 99%, stress test ma trwać 15 minut:

Generowane wykorzystanie CPU wedle przepisu:
```
User = 34%
SYS =  75%
```


![](src/think.gif "")
Aby zasymulować wykorzystanie CPU wedle powyższych kryteriów należy użyć:
```
# stress --cpu 1 --vm 6 --timeout 900s
```

## Analiza wykresu na podstawie danych wyświetlanych w grafanie.

Do pomiaru aktualnego wykorzystania pamięci i CPU można użyć narzędzia nmon. Jest ono zainstalowane na obu testowych maszynach (vm3-os i vm4-os). Aby móc zweryfikować aktualny stan pamięci i CPU zaloguj się na obie maszyny używając vagrant ssh. Kolejno z użytkownika root wykonaj polecenie nmon.

vm3-os:
![](src/stress-test-1.jpg "")

vm4-os:
![](src/stress-test-2.jpg "")

Zaloguj się do Grafany:

http://localhost:3000

(użytkownik admin , hasło crc2019).

Kolejno przejdź do wykresów:

![](src/stress-test-4.jpg "")

W ramach cwiczenia przeanalizuj wykresy w celu wychwycenia 2 szczytów:

- vm3-os (ostatnie 30 minut - CPU TOTAL)
- vm4-os (ostatnie 30 minut)- memory usag)

Wnioski?
