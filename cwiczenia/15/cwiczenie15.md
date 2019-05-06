# Cwiczenie 15

## Cel

Celem ćwiczenia będzie storzenie własnego grafu, zdefiniowania własnego źródła
danych oraz definicja zmiennych wykresu. Pozwoli nam to nam to na ogólne rozeznanie
w innterfejsie graficznym jaki oferuje Grafana.


## Elemnty labotatorium

Tu znajdziecie ogólny zarys wymagań oraz elementów ćwiczenia:

+ Kontenery
  * vm-influxdb (kontener bazy danych)
  * vm-grafana  (kontener z grafaną)
  * vm-asystent (kontener z testową aplikacją)


+ Bazy danych
  * monitor

## Weryfikacja kontenerów oraz poszczególnych elementów laboratorium:

Po zalogowaniu na serwer z dockerem z poziomu użytkownika studentvm wpisujemy:
```
docker ps | egrep "vm-grafana|vm-influxdb|vm-asystent"
3a21760bb51c        crcdevops/asystent:latest      "/bin/sh -c /usr/loc…"   About an hour ago   Up About an hour                                        vm-asystent
d0bbee5d4b6e        crcdevops/influxdb:latest      "/entrypoint.sh infl…"   About an hour ago   Up About an hour    0.0.0.0:8086->8086/tcp              vm-influxdb
bbe9910909b3        crcdevops/grafana:latest       "/run.sh"                About an hour ago   Up About an hour    3001/tcp, 0.0.0.0:3001->3000/tcp    vm-grafana
```

*Jeżeli kontenery nie wystartowały lub nie są uruchomione zapytaj instruktora*

Wylistuj zawartość katalogu: cwiczenia/10

```
$ pwd
/home/studentvm/cwiczenia/10
$ ls -laR
total 48
drwxrwxr-x. 3 plp12439 plp12439  4096 Mar  5 11:46 .
drwxrwxr-x. 4 plp12439 plp12439  4096 Mar  5 15:00 ..
-rw-rw-r--. 1 plp12439 plp12439 11649 Mar  5 14:58 cwiczenie10.README
drwxrwxr-x. 2 plp12439 plp12439  4096 Mar  5 10:52 src
-rw-rw-r--. 1 plp12439 plp12439 20986 Mar  1 16:35 wykonaj.sh

```

Jeżeli zawartość jest zgodna można przejść do cześci praktycznej ćwiczenia.


## Tworzenie źródła danych dla wykresów.

Z menu głównego grafany wybieramy:<br/>
![](src/zrodlo-danych-1 "")

Klikamy przycisk "Add data source"<br/>
![](src/zrodlo-danych-2 "")

Wybieramy typ danych w naszym przypadku "InfluxDB"<br/>
![](src/zrodlo-danych-4 "")

Uzupełniamy treści stanowiące definicje źródła danych:<br/>
![](src/zrodlo-danych-3 "")

Zapisujemy ustawienia oraz testujemy połącznenie:<br/>
![](src/zrodlo-danych-5 "")

Weryfikacja połączenia do bazy danych.<br/>
![](src/zrodlo-danych-6 "")

`W przypadku gdy test zakończył się niepowodzeniem należy jeszcze raz przejżeć ustawienia naszego źródła danych z poprzedniego kroku.`

## Tworzenie folderu.
Tworzenie folderów ma sens gdy checmy utrzymać system w należytym porządku. Cięzko sobie wyobrazić, że wszystkie pliki będziemy trzymać bezpośrednio na pulpicie :)<br/>

Po naciśnięciu "+" wybieramy "Folder"<br/>
![](src/folder-1 "")

Kolejno ustalamy nazwę naszego folderu<br/>
![](src/folder-2 "")

###### Weryfikacja:
Po kliknieciu "Home" u samej góry w menu powinniśmy zobaczyć nasz folder:<br/>
![](src/folder-3 "")

## Tworzenie grafu.

Po wejściu w folder powinniśmy mieć możliwość utworzenia nowego "Dashboardu" tak jak na załączonym zdjęciu:<br/>
![](src/tworzenie-grafu-1 "")

Klikamy "Add" → "Graph":<br/>
![](src/tworzenie-grafu-2 "")

Klikamy "Panel Ttile" → "Edit":<br/>
![](src/tworzenie-grafu-3 "")

W sekcji query należy wybrać właściwe źródło danych:<br/>
![](src/tworzenie-grafu-4 "")
<br/><br/>
`Krok ten można pominąć gdy ustatliliśmy wcześniej nasze domyślne źródło. W takim przypadku każdy nowo stworzony
graf będzie pobierał dane z domyślnego źródła danych. Takie podejscie pozwala nam zaoszczędzić trochę czasu przy dużych konfiguracjach.`

Uzupełniamy zawartość zapytania:<br/>
![](src/tworzenie-grafu-5 "")

Grafana w wersji 5 posiada szereg udogodnień. Poniżej jedna z nich:<br/>

![](src/tworzenie-grafu-6 "")<br/><br/>

`Zwróccie uwagę na ciekawą opcje "Duplicate". Pozwala na kopiowanie powyższego zapytania. Jest to bardzo użyteczna funkcja pozwalająca na skopiowanie wcześniej zdefiniowanego zapytania. Jeżeli nasz graf korzysta z kilku podobnych obiektów można w ten sposób usprawnić proces kreowania tego typu grafu.`
<br/><br/>
Kopiujemy wcześniej zdefiniowane zapytanie za pomocą "Duplicate", kolejno modyfikujemy zapytania tak, aby graf wyświetlał 3 zmienne: User, Sys, Idle

Definicje należy porawić wedle poniższego klucza:
```
Data Source = CRC-MONITOR
A = FROM default cpu WHERE host = server1
    SELECT field(user) mean()
    GROUP BY time(1m) fill(none)
    FORMAT AS Time series
    ALIAS BY User

Data Source = CRC-MONITOR
A = FROM default cpu WHERE host = server1
    SELECT field(sys) mean()
    GROUP BY time(1m) fill(none)
    FORMAT AS Time series
    ALIAS BY Sys

Data Source = CRC-MONITOR
A = FROM default cpu WHERE host = server1
    SELECT field(idle) mean()
    GROUP BY time(1m) fill(none)
    FORMAT AS Time series
    ALIAS BY Idle
```

Klikamy gdzieś poza definicje. Zmiany powinny być już widoczne i graf powyżej powinien wyświetlać dane.<br/>

![](src/tworzenie-grafu-7 "")<br/><br/>
Kolejny etap to ustalenie jednostki na osi Y<br/>
![](src/tworzenie-grafu-8 "")

`Bardzo ciekawą opcją jest Query Inspector. Można go używać do debugowania zapytań w trakcie konfiguracji. Co prawda output dostajemy w formacie json ale przy odpowiednim parserze jesteśmy w stanie dowiedzieć, śię czy nasze zapytanie działa poprawnie i jakie wartości zwraca.`
![](src/tworzenie-grafu-9 "")

W zakładce General nadajem tytuł oraz krótki opis:<br/>
![](src/tworzenie-grafu-10 "")

```
Title: CPU
Description: Ćwiczenie 10 użycie CPU
```

W Zakładce Axes dla osi Y określamy jednostkę oraz inne parametry wykresu:<br/>
![](src/tworzenie-grafu-11 "")
```
Left Y
Unit: procent(0-100)
Scale: linear
Y-Min: 0
Y-Max: 101
Decimals: 1
Label: Procent

Right Y
Unit: short
Scale: linear

X-Axis
Show: X
Mode: Time

```
<br/>
Definiujemy legende:
![](src/tworzenie-grafu-12 "")
<br/><br/>
Modyfikacja wygladu:<br/>
![](src/tworzenie-grafu-13 "")


## Modyfikacja wyglądu oraz kolorów
Grafana daje nam olbrzymie możliwości manipulacji. Możemy dowolnie zmieniać rozmiar,
kolory opis grafów. Poniżej demonstracja w jaki sposób zmodyfikować istniejacy już graf.

Wybieramy nasz graf oraz klikamy na element legendy np User.
![](src/modyfikacja-kolorow1 "")

Zmiana kolorów wedle klucza:

```
User: ciemno czerwony
Sys: jasno Żółtu
Idle: jasno zielony
```

`Po wyborze koloru zmiany pojawiaja się płynnie co nie wymaga żadnej dodatkowej operacji.`

![](src/modyfikacja-kolorow2 "")
<br/><br/>
Po modyfikacjach graf powinien wyglądać mniej więcej tak:
![](src/modyfikacja-kolorow3 "")

`W ramach cwiczenia proponuję przećwiczyc zmianę kolorów oraz wyglądu grafu.`

## Tworzenie grafu "single stat"
Grafana oferuje kilka rodzajów grafów. W zależności od tego co chcemy wyświetlać można wybrać
swój preferowany typ. Należy pamiętać, że nie każdy typ grafu będzie nadawał sie do wyświetlania
wszystkiego rodzaju danych. Wszystko zależy od tego co chcemy wizualizować.

Tworzymy nowy graf typ: "Singlestat":<br/>
![](src/tworzenie-grafu2-1 "")

Nadanie tytułu oraz opisu:
![](src/tworzenie-grafu2-2 "")

Wybór metryk oraz parametryazacja zapytania:<br/>
![](src/tworzenie-grafu2-3 "")

Finalnie powinniśmy uzyskać następujący efekt:<br/>
![](src/graf2 "")

Jak już wcześniej wspominaliśmy grafana posiada szereg udogodnień oraz funkcji usprawniajacych administracje. Poniżej jedna z nich.
Kolejnym zadaniem jest powielenie istnijącego już grafu "Singlestat" oraz modyfikacja pod kątem 2 pozostałych metryk (sys,idle)

Klikamy na "CPU - user(single)" → "More" → "Duplicate"<br/>
![](src/tworzenie-grafu3-1 "")<br/><br/>
To pozwoli nam skopiować istnejący już graf i zaoszczędzić czas potrzebny na stworzenie go od zera.<br/>

Operacje kopiowania należy wykonać dwukrotnie ponieważ dla każdego parametru CPU będziemy posiadać osobny graf statystyk.

Wykonujemy następujące czynności:<br/>

Ustawienie tytułu:<br/>
![](src/tworzenie-grafu3-0 "")

Modyfikacja selectora:<br/>
![](src/tworzenie-grafu3-2 "")

Zmiana opcji wyglądu:<br/>
![](src/tworzenie-grafu3-3 "")


`Operację tą należy powtorzyć dla "Singlestat" Idle. Jedyna różnica to tytuł grafu oraz selector.
W ramach ćwiczenia zachęcam do modyfikacji koloru oraz paru eksperymentów dotyczących wyglądu.`

# Utworzenie grafu typu "wykres kołowy"

Wymaganiem do tego ćwiczenia jest zainstalowany plugin Pie Chart w wersji 1.3.6 lub wyższej.

Utworzenie grafu "CPU Summary"

Dodajemy nowy graf oraz ustawiamy następujące parametry (3 selectory)<br/>
![](src/tworzenie-grafu4-2 "")

```
Data Source = CRC-MONITOR
A = FROM default cpu WHERE host = server1
    SELECT field(user) mean()
    GROUP BY time(1m) fill(none)
    FORMAT AS Time series
    ALIAS BY User

Data Source = CRC-MONITOR
A = FROM default cpu WHERE host = server1
    SELECT field(sys) mean()
    GROUP BY time(1m) fill(none)
    FORMAT AS Time series
    ALIAS BY Sys

Data Source = CRC-MONITOR
A = FROM default cpu WHERE host = server1
    SELECT field(idle) mean()
    GROUP BY time(1m) fill(none)
    FORMAT AS Time series
    ALIAS BY Idle
```
Ustawienie zmiennych wyglądu:
![](src/tworzenie-grafu4-3 "")

Finalnie nasz dashboard powinien wyglądać mniej wiecej tak:

![](src/przeglad "")


### Jeżeli z jakiegoś powodu nie byłeś w stanie wykonać tego ćwiczenia użyj skryptu.
```
~./cwiczenia/10/wykonaj.sh admin crc2019

--------------------------------------------------

Cwiczenie 10.a - Utworzenie folderu na grafy
{"id":28,"uid":"aa2psaa864","title":"CRC","url":"/dashboards/f/aa2psaa864/crc","hasAcl":false,"canSave":true,"canEdit":true,"canAdmin":true,"createdBy":"admin","created":"2019-03-01T15:21:18Z","updatedBy":"admin","updated":"2019-03-01T15:21:18Z","version":1}
--------------------------------------------------

Cwiczenie 10.b - Utworzenie źródła danych CRC-MONITOR
{"datasource":{"id":11,"orgId":1,"name":"CRC-MONITOR","type":"influxdb","typeLogoUrl":"","access":"proxy","url":"http://vm-influxdb:8086","password":"crc2019","user":"monitor","database":"monitor","basicAuth":false,"basicAuthUser":"","basicAuthPassword":"","withCredentials":false,"isDefault":false,"secureJsonFields":{},"version":1,"readOnly":false},"id":11,"message":"Datasource added","name":"CRC-MONITOR"}
--------------------------------------------------

Cwiczenie 10.c - Tworzenie dashboardu CRC Cwiczenie 10
{"id":29,"slug":"crc-cwiczenie-10","status":"success","uid":"i8OUKeriz","url":"/d/i8OUKeriz/crc-cwiczenie-10","version":1}
```

`Uwaga! jako parametry skryptu podajemy użytkownika i hasło. W naszym przypadku będzie to admin:crc2019`

Trouble shooting:

W jaki sposób zdiagnozować czy dane pojawiają się w bazie danych

```
docker exec -it vm-influxdb influx
Connected to http://localhost:8086 version 1.7.3
InfluxDB shell version: 1.7.3
Enter an InfluxQL query
> use monitor
Using database monitor
> show measurements;
name: measurements
name
----
cpu
> select count(*) from cpu;
name: cpu
time count_idle count_sys count_user
---- ---------- --------- ----------
0    470        470       470
> show series;
key
---
cpu,host=server1,location=eu-south
cpu,host=server10,location=eu-south
cpu,host=server2,location=eu-north
cpu,host=server3,location=eu-east
cpu,host=server4,location=eu-west
cpu,host=server5,location=eu-west
cpu,host=server6,location=eu-north
cpu,host=server7,location=eu-east
cpu,host=server8,location=eu-east
cpu,host=server9,location=eu-south
```

Polecenie count zlicza ilość wierszy w naszej bazie danych natomiast polecenie show series pokazuje wszystkie dostępne szeregi czasowe.
