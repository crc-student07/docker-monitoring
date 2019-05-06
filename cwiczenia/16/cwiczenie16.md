# Cwiczenie 16

## Cel
W tej części dowiesz się jak używać zmiennych w dashboardach oraz jak stosować filtry wyrażeń regularnych. Cwiczenie ma zademonstrować nam w jaki sposób stworzyć rozwijjaną listę dla obiektów, które monitorujemy

## Wymagane elementy
### Uwaga
W odrużnieniu od poprzednich ćwiczeń w tym ćwiczeniu użyjemy zasobów lokalnych. Na każdym komputerze został zainstalowany VirtualBox oraz vagrant w wersji umożliwiającej uruchomienie laboratorium złożonego z 6 maszyn.

+ Oprogramowanie i pakiety:
  * vagrant 2.x
  * python 2.7 lub nowszy
  * git 1.8 lub nowszy
  * VirtualBox 5.0 lub nowszy

+ Maszyny wirtualne vagrant
  * vm-grafana      (192.168.100.2)
  * vm-influxdb     (192.168.100.3)
  * vm-njmon        (192.168.100.4)
  * vm1-os          (192.168.100.10)
  * vm2-os          (192.168.100.11)
  * vm3-os          (192.168.100.12)
  * vm4-os          (192.168.100.13)

Katalog vagrant wraz z plikami:

```
.
|-- README.md
|-- secure
|   |-- id_rsa_vagrant
|   `-- id_rsa_vagrant.pub
|-- src
|   |-- etc
|   |   |-- hosts
|   |   `-- motd
|   |-- keys
|   |   |-- id_rsa
|   |   `-- id_rsa.pub
|   `-- scripts
|       `-- provisioning
|           |-- grafana.sh
|           |-- prometheus.sh
|           `-- root-ssh-access.sh
`-- Vagrantfile

6 directories, 11 files

```

## Przygotowanie środowiska
Aby móc wykonać poniższe ćwiczenie należy zainstalować niezbędne pakiety. Jakie konkretnie? patrz punkt "Oprogramowanie i pakiety". Aby zaoszczędzić wam czasu pakiety na komuterach laboratorium zostały już zainstalowane. Upewnijcie się jednak czy macie wszystko:

```
$rpm -qa | egrep "VirtualBox|vagrant|git-1|python-2.7."
python-2.7.5-69.el7_5.x86_64
vagrant-2.2.3-1.x86_64
VirtualBox-5.2-5.2.20_125813_el7-1.x86_64
git-1.8.3.1-14.el7_5.x86_64
```


### Sklonowanie repozytorium:

W katalogu domowym użytkownika studentvm utwórz katalog: vagrant-grafana:

`$ mkdir vagrant-grafana`

git clone https://johnkk84:<>@github.com/johnkk84/vagrant-grafana.git vagrant-grafana


### Deployment maszyn (Vagrantfile):
