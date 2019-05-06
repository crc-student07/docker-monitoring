echo "--------------------- POCZĄTEK ĆWICZENIA ---------------------"
echo ""
echo "#####################################################################################################"
echo "# Cwiczenie 2 - Stworzenie 2 użytkowników administrator, gosc i zapisanie ich do organizacji Grupa2 #"
echo "#####################################################################################################"

echo ""
echo "Tworzymy nową organizację:"
echo ""
echo "Organizacja Grupa2 dla użytkownika administrator i gość:"
curl -X POST -H "Content-Type: application/json" -d '{ "name":"Grupa2","orgId":3}' http://$1:$2@vm-grafana:3000/api/orgs
echo ""
echo "------------------------------------------------------"
echo ""
echo "Tworzymy użytkowników:"
echo ""
curl -X POST -H "Content-Type: application/json" -d '{"name":"Administrator","email":"administrator@devops.crc","login":"administrator","password":"crc2019" }' http://$1:$2@vm-grafana:3000/api/admin/users
curl -X POST -H "Content-Type: application/json" -d '{ "name":"Gosc","email":"gosc@devops.crc","login":"gosc","password":"crc2019" }' http://$1:$2@vm-grafana:3000/api/admin/users
echo ""
echo "----------------------------------------------------------------------------------"
echo ""
echo "Dodajemu użytkowników do organizacji Firma1:"
echo ""
curl -X POST -H "Content-Type: application/json" -d '{ "loginOrEmail":"gosc", "role":"Viewer" }' http://$1:$2@vm-grafana:3000/api/orgs/3/users
curl -X POST -H "Content-Type: application/json" -d '{ "loginOrEmail":"administrator", "role":"Admin" }' http://$1:$2@vm-grafana:3000/api/orgs/3/users
echo ""
echo "Usuwamy użytkownika administratora oraz gosca z organizacji Main Org.:"
echo ""
curl -X DELETE -H "Content-Type: application/json" http://$1:$2@vm-grafana:3000/api/orgs/1/users/4
curl -X DELETE -H "Content-Type: application/json" http://$1:$2@vm-grafana:3000/api/orgs/1/users/5
echo ""
echo ""
echo "--------------------- KONIEC ĆWICZENIA ---------------------"
echo ""
