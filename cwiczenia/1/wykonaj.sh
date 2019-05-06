echo "--------------------- POCZĄTEK ĆWICZENIA ---------------------"
echo ""
echo "####################################################"
echo "# Cwiczenie 1 - Zmiana hasła dla użytkownika admin #"
echo "####################################################"

echo ""
echo "Zmieniamy hasło użytkownika admin na crc2019"
curl -X PUT -H "Content-Type: application/json" -d '{ "oldPassword": "admin","newPassword": "crc2019","confirmNew": "crc2019" }' http://admin:admin@vm-grafana:3000/api/user/password
echo ""
echo ""
echo "--------------------- KONIEC ĆWICZENIA ---------------------"
echo ""
