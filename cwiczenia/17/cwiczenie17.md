# Cwiczenie 17

## Cel

W tym ćwiczenie dowiesz się jak w prosty sposób pisać własne reguły oraz wyzwolone alarmy przekazywać do slacka. Temat jest bardzo obszerny w związku z tym będziemy bazować na wcześniej przygotowanej konfiguracji.

## Wymagane elementy

+ Kontenery
  * vm-prometheus
  * vm-grafana
  * vm-alert
  * vm1-os
  * vm2-os
  * vm-apache
  * exp-apache


## Weryfikacja poszczególnych elementów laboratorium:

Po zalogowaniu na serwer z dockerem z poziomu użytkownika studentvm wpisujemy:
```
docker ps -a | egrep "vm-prometheus|vm-grafana|vm-alert|vm[1-2]-os|vm-apache|exp-apache"
5c49d150ef9f        crcdevops/apache-exp:latest      "/bin/sh -c '/bin/ap…"   25 hours ago        Up 25 hours               0.0.0.0:9117->9117/tcp                                                                                                                                                      exp-apache
3bce156cba72        crcdevops/alert-manager:latest   "/bin/alertmanager -…"   25 hours ago        Up 24 hours               0.0.0.0:9993->9093/tcp                                                                                                                                                      vm-alert
18e84b76e6e4        crcdevops/redhat:latest          "node_exporter"          25 hours ago        Up 25 hours               0.0.0.0:10002->9100/tcp                                                                                                                                                     vm2-os
86a862f124fa        crcdevops/redhat:latest          "node_exporter"          25 hours ago        Up 25 hours               0.0.0.0:10001->9100/tcp                                                                                                                                                     vm1-os
78246239b311        crcdevops/apache:latest          "httpd-foreground"       25 hours ago        Up 25 hours               8080/tcp, 0.0.0.0:81->80/tcp                                                                                                                                                vm-apache
9bb4bd5cfaf8        crcdevops/prometheus:latest      "/bin/prometheus --c…"   25 hours ago        Up 25 hours               0.0.0.0:9999->9090/tcp                                                                                                                                                      vm-prometheus
f40ed5c375fe        crcdevops/grafana:latest         "/run.sh"                25 hours ago        Up 25 hours               0.0.0.0:3000->3000/tcp, 3001/tcp
```

*Jeżeli kontenery nie wystartowały lub nie są uruchomione zapytaj instruktora*

```Każdy uczestnik warsztatów otrzymuje numer, który przydziela prowadzący ćwiczenia. Poniżej tabela zawierająca numer uczestników oraz unikatowy link "incoming webhook". Link ten należy wstawić w odpowiednim miejscu pliku konfiguracyjnego kontenera vm-alert.```

*tabela 1*

| Twój numer | Webhook URL                                                                   |
|----------- |-------------------------------------------------------------------------------|
| studentvm01  | https://hooks.slack.com/services/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 |
| studentvm02  | https://hooks.slack.com/services/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 |
| studentvm03  | https://hooks.slack.com/services/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 |
| studentvm04  | https://hooks.slack.com/services/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 |
| studentvm05  | https://hooks.slack.com/services/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 |
| studentvm06  | https://hooks.slack.com/services/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 |
| studentvm07  | https://hooks.slack.com/services/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 |
| studentvm08  | https://hooks.slack.com/services/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 |
| studentvm09  | https://hooks.slack.com/services/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 |
| studentvm10  | https://hooks.slack.com/services/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 |
| studentvm11  | https://hooks.slack.com/services/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 |
| studentvm12  | https://hooks.slack.com/services/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 |
| studentvm13  | https://hooks.slack.com/services/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 |
| studentvm14  | https://hooks.slack.com/services/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 |
| studentvm15  | https://hooks.slack.com/services/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 |
| studentvm16  | https://hooks.slack.com/services/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 |
| studentvm17  | https://hooks.slack.com/services/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 |
| studentvm18  | https://hooks.slack.com/services/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 |
| studentvm19  | https://hooks.slack.com/services/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 |
| studentvm20  | https://hooks.slack.com/services/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 |

```Wszystkie polecenia wykonujemy z poziomu użytkownika studentvm```

## Konfiguracja alert managera

```
docker exec -it --user root vm-alert /bin/sh
/alertmanager # cd /etc/alertmanager
/etc/alertmanager # ls
alertmanager.yml
/etc/alertmanager # vi alertmanager.yml
```

Edytujemy plik alert managera aktywując linie odpowiadające za konfiguracje alert managera. Pamiętajcie by zastępując wyrażenia w nawiasach skośnych podać właściwy numerem uczestnika! Należy pamiętać również by uzupełnić pole "api_url". Jest unikatowe dla każdego uczestnika szkolenia, patrz tabela 1. Zapisujemy zmiany oraz wychodzimy z edytora vi.

Plik przed edycją:

```
route:
   receiver: 'slack'

receivers:
- name: 'slack'
#  slack_configs:
#  - channel: '#alerty-crc-<numer przydzielony przez instruktora - tabela 1 cw. 12>'
#    username: 'studentvm-<numer przydzielony przez instruktora - tabela 1 cw. 12>'
#    icon_url: https://avatars3.githubusercontent.com/u/3380462
#    send_resolved: true
#    title: '{{ template "custom_title" . }}'
#    text: '{{ template "custom_slack_message" . }}'
#    api_url: 'https://hooks.slack.com/services/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'

#templates:
#  - /alertmanager/notifications.tmpl
```

Plik po zmianach (przykład dla uczestnika z numerem porządkowym 01)

```
route:
   receiver: 'slack'

receivers:
- name: 'slack'
  slack_configs:
  - channel: '#alerty-crc-02>'
    username: 'studentvm-02'
    icon_url: https://avatars3.githubusercontent.com/u/3380462
    send_resolved: true
    title: '{{ template "custom_title" . }}'
    text: '{{ template "custom_slack_message" . }}'
    api_url: 'https://hooks.slack.com/services/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'

templates:
  - /alertmanager/notifications.tmpl
```


Aby zmiany zostały wczytane należy zamknać interaktywne połączenie z poziomu konsoli docker wpisujemy (exit), kolejno restartujemy kontener vm-alert.

```
/etc/alertmanager # exit
$ docker restart vm-alert
vm-alert
$ docker ps -a | grep vm-alert
3bce156cba72        crcdevops/alert-manager:latest   "/bin/alertmanager -…"   25 hours ago        Up 1 minutes              0.0.0.0:9993->9093/tcp                                                                                                                                                      vm-alert
```

# Weryfikacja
Aby zweryfikować poprawność konfiguracji alert managera zatrzymamy 1 z kontenerów, który monitoruje prometheus server. Po zatrzymaniu konetenera vm1-os powinien zostać wygenerowany alert oraz przesłany na odpowiedni slack channel.

Uruchamiamy slack desktop skrót mieści się na pulpicie:

![](src/slack-01 "")<br/>

Po uruchomieniu kontenera vm1-os na slacku powinien pojawić się nowy event [RESOLVED]

W ramach cwiczenia można zatrzymać inne maszyny będące częścią laboratorium.

## Modyfikacja istniejących reguł
Konfiguracja reguł możecie znaleźć na kontenerze vm-prometheus. Aby je zmodyfikować należy zalogować się do kontenera używając interaktywnego połącznia z poziomu docker. W tym celu z użytkownika studentvm wpisujemy:

```
$ docker exec -it --user root vm-prometheus sh
```

Kolejno przechodzimy do katalogu konfiguracyjnego:

```
/prometheus # cd /etc/prometheus/
/etc/prometheus # ls -la
total 20
drwxr-xr-x    2 nobody   nogroup       4096 Mar 11 09:50 .
drwxr-xr-x    6 root     root          4096 Mar 11 11:15 ..
lrwxrwxrwx    1 nobody   nogroup         39 Mar  2 15:51 console_libraries -> /usr/share/prometheus/console_libraries
lrwxrwxrwx    1 nobody   nogroup         31 Mar  2 15:51 consoles -> /usr/share/prometheus/consoles/
-rw-rw-r--    1 root     root          2480 Mar 11 09:49 crc-rules-docker.yml
-rw-rw-r--    1 1001     1001           203 Mar  9 15:07 mq-targets.yml
-rw-rw-r--    1 1001     1001          2361 Mar 10 20:08 prometheus.yml
```

Edytujemy plik crc-rules-docker.yml oraz odszukujemy regułę:

```
# High memory usage
- alert: high_memory_usage
  expr: (sum(node_memory_MemTotal) - sum(node_memory_MemFree + node_memory_Buffers + node_memory_Cached) ) / sum(node_memory_MemTotal) * 100 > 50
  for: 2m
  labels:
    severity: warning
  annotations:
    summary: "High memory utilisation for {{ $labels.instance }}"
    description: "{{ $labels.instance }} of job {{ $labels.job }} has high memory utilisation , the utilisation is currently: {{ $value }}%"
```

Zmieniamy wartość progu z 50% na 20% oraz czas trwania z 2 m na 1m. Po zmianach reguła powinna wyglądać następująco:

```
# High memory usage
- alert: high_memory_usage
  expr: (sum(node_memory_MemTotal) - sum(node_memory_MemFree + node_memory_Buffers + node_memory_Cached) ) / sum(node_memory_MemTotal) * 100 > 20
  for: 1m
  labels:
    severity: warning
  annotations:
    summary: "High memory utilisation for {{ $labels.instance }}"
    description: "{{ $labels.instance }} of job {{ $labels.job }} has high memory utilisation , the utilisation is currently: {{ $value }}%"
```

Aby zmiany były widoczne dla serwera prometheus należy go zrestartować. W tym celu wydajemy następujące polecenie:

```
docker restart vm-prometheus
```

## Weryfikacja
W celu weryfikacji czy konfiguracja zapisała się poprawnie użyj następującej komendy:


```
docker exec -it --user root vm-prometheus sh -c "cat /etc/prometheus/crc-rules-docker.yml"
```

Aby zweryfikować czy prometheus server zareaguje na duże zużycie pamięci na kontenerze należy sprowokować system. W tym celu użyjemy narzędzia stress zainstalowanego w kontenerze vm1-os oraz vm2-os.

W związku z tym podłączamy interaktywną konsolę do kontenera vm1-os:

docker exec -it vm1-os bash -c "stress -c 20 -i 1 -m 1 --vm-bytes 4G"

Po upływie około 2 minut powinien zostać wygenerowany alert na poziomie "warning" i wysłany na kanale slack alerty-crc-<numer_uczestnika>
