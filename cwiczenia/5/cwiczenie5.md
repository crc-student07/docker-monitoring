# Cwiczenie 5

## Cel
W ćwiczeniu zajmiemy się konfiguracją plugina WorldPing. Jest to narzędzie, które idealnie nadaje się do monitorowania dostępności webserwisów oraz stron z zewnątrz. Istniej możliwość skonfigurowania próbników na różnych kontynentach! Pozwala na bardzo dokładny monitoring dostępności web serwisów.


## Elemnty labotatorium

Tu znajdziecie ogólny zarys wymagań oraz elementów ćwiczenia:

+ Kontenery
  * vm-grafana


## Weryfikacja kontenerów oraz poszczególnych elementów laboratorium:

Po zalogowaniu na serwer z dockerem z poziomu użytkownika "studentvm" wpisujemy:
```
docker ps -a | egrep "vm-grafana"
```

*Jeżeli kontener nie wystartował lub nie jest uruchomiony poproś o pomoc instruktora*

## Logujemy się do Grafany (SoftLayer)

http://grafana:3000

Uwaga!

Do logowania używamy następujących danych:

login: admin
hasło: crc2019

## Logujemy się do Grafany (Grafana cloud - https://grafana.com/)
Czemu tak? Będziemy potrzebować klucza aby móc aktywować WorldPing w naszym systemie. Część Plaginów wymaga aktywacji konta w Grafana Cloud. Jest to zwiazane głównie z pluginami premium.

Po zalogowaniu klikamy "Personal" następnie "Add API Key":<br/>
![](src/worldping-1.jpg "")

Nadajemy nazwę oraz definiujemy uprawnienia:<br/>
![](src/worldping-2.jpg "")

Klikając "Copy to Clipboard" zalecam zapisanie klucza w pliku tymczasowym gdyż przyda się w kolejnym punkcie:<br/>
![](src/worldping-3.jpg "")

Należy używać opisów, które ułatwią rozpoznianie kluczą lub mowią o jego zastosowaniu:<br/>
![](src/worldping-4.jpg "")

Aktywujemy plugin logując się do naszego systemu (Grafana w SoftLayer):<br/>
![](src/worldping-5.jpg "")

Podajemy klucz wygenerowany na portalu grafana.com:<br/>
![](src/worldping-7.jpg "")

Weryfikujemy poprawność działania klucza:<br/>
![](src/worldping-8.jpg "")

Po aktywowaniu pluginu klikając "Readme" dostrzerzemy dość obszerną dokumentacje:<br/>
![](src/worldping-9.jpg "")

Definiujemy nowe endpointy (czyli strony, które chcemy monitorować):<br/>
![](src/worldping-10.jpg "")

Klikamy "New Endpoint":<br/>
![](src/worldping-11.jpg "")

Ustawiamy nazwę dla naszego endpointa. Zwykle należy użyć takiej samej nazwy jak nazwa serwer:<br/>
![](src/worldping-12.jpg "")

Plugin sam wykryje oraz dopasuje możliwość monitorowania poszczególnych usług:<br/>
![](src/worldping-13.jpg "")
<br/><br/>
Pierwszye zebranie danych oraz wykrycie dostępnych serwisów może zająć do 120s:<br/>
![](src/worldping-14.jpg "")

Jesteśmy w stanie wybrać endpointy z listy (jeżeli mamy kilka zdefiniowanych). World ping pozwala monitorować serwis w czasie zbliżonym do rzeczywistego. W ramach ćwiczenia zachęcam do eksperymentów ;-) Spróbujcie przejść przez wszystkie poniższe dashboardy oraz zweryfikować, które próbniki monitorują waszą stronę.<br/>
![](src/worldping-15.jpg "")
<br/><br/>
![](src/worldping-16.jpg "")
<br><br/>
Uwaga serwer http://www.ibm.com przekierowywuje cały ruch na https://www.ibm.com stąd brak monitorowania na porcie 80:<br/>
![](src/worldping-17.jpg "")
<br/><br/>
![](src/worldping-18.jpg "")


[<img src="../images/prev.png">](../../cwiczenia/4/cwiczenie4.md)
[<img src="../images/next.png">](../../cwiczenia/6/cwiczenie6.md)
