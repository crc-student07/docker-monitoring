# Cwiczenie 18

## Cel

W tym ćwiczenie dowiesz się jak skonfigurować monitoring dla Kubernetes (K8s). Do stworzenia Kubernetes klastra wykorzystamy repozytorium pomocnicze.
Znajdziemy tam kod, który posłuży nam do uruchomienia własnego nizależnego środowiska.

## Wymagane elementy

+ Konto Github
+ podstawowa wiedza z zakresu konfigurowania i zarządzania K8s


## Budowa i konfiguracja K8S

### Klonowanie KVSL

git clone https://github.ibm.com/CRC/kubernets-vagrant.git

### Inicjalizacja środowiska
W katalogu sklonowanego repozytotium tam gdzie znajduje się plik Vagrantfile z wiersza poleceń
wpisujemy:

```
vagrant up
```

Wykonanie tej komendy może zająć do 10 minut. Proszę o cierpliwość ;-)

Output komendy powinien wyglądać mniej wiecej tak:
```
Bringing machine 'k8s-master' up with 'virtualbox' provider...
Bringing machine 'node-1' up with 'virtualbox' provider...
Bringing machine 'node-2' up with 'virtualbox' provider...
==> k8s-master: Importing base box 'bento/ubuntu-16.04'...
==> k8s-master: Matching MAC address for NAT networking...
==> k8s-master: Checking if box 'bento/ubuntu-16.04' version '201806.08.0' is up to date...
==> k8s-master: A newer version of the box 'bento/ubuntu-16.04' for provider 'virtualbox' is
==> k8s-master: available! You currently have version '201806.08.0'. The latest is version
==> k8s-master: '201812.27.0'. Run `vagrant box update` to update.
.
..
...
PLAY RECAP *********************************************************************
node-2                     : ok=13   changed=12   unreachable=0    failed=0   
```

### Weryfikacja K8s oraz poszczególnych nodów
Przed rozpoczęciem deploymentu Grafany oraz Prometheusa należy zweryfikować poprawność działania K8s. W związku z tym
wydajemy następujące polecenia:

```
vagrant ssh k8s-master
vagrant@k8s-master:~$ kubectl get nodes
NAME         STATUS   ROLES    AGE   VERSION
k8s-master   Ready    master   33m   v1.14.1
node-1       Ready    <none>   28m   v1.14.1
node-2       Ready    <none>   23m   v1.14.1
```


### Instalacja oraz inicjalizacja helm
Aby zainstalować komponenty prometheus serwera oraz exporter w klastrze kubernetes potrzebujemy
helm'a. W skrócie jest to menager słóżący do zarządzania aplikacjami w K8s. Dzięki niemu możemy
bardzo łatwo zainstalować interesujące nas komponenty.  

### Instalacja helm:
Na nodzie głównym K8s
```
curl https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz --output helm-v2.13.1-linux-amd64.tar.gz
tar -zxvf helm-v2.13.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

### Weryfikacja oraz sprawdzenie wersji:

```
$ helm version
Client: &version.Version{SemVer:"v2.13.1", GitCommit:"618447cbf203d147601b4b9bd7f8c37a5d39fbb4", GitTreeState:"clean"}
Error: Get https://192.168.224.2:6443/api/v1/namespaces/kube-system/pods?labelSelector=app%3Dhelm%2Cname%3Dtiller: dial tcp 192.168.224.2:6443: connect: connection refused
$ helm ls
Error: configmaps is forbidden: User "system:serviceaccount:kube-system:default" cannot list configmaps in the namespace "kube-system"

$ kubectl create clusterrolebinding tiller-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

$ helm init --service-account tiller --upgrade
$HELM_HOME has been configured at /root/.helm.

Tiller (the Helm server-side component) has been upgraded to the current version.
Happy Helming!
[node1 ~]$ helm ls
[node1 ~]$ helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring
```
