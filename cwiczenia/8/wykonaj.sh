#!/bin/bash
echo "--------------------- POCZĄTEK ĆWICZENIA ---------------------"
echo ""
echo "################################################"
echo "# Cwiczenie 7 - Konfiguracja mariadb exportera #"
echo "################################################"
echo "Kopiowanie pliku sql do wykonania:"
docker cp sql/uprawnienia.sql vm-mariadb:/tmp/uprawnienia.sql
echo ""

echo "Nadanie uprawnień:"
docker exec -it vm-mariadb bash -c "mysql -u root -pcrc2019 </tmp/uprawnienia.sql"
echo ""

echo "Weryfikacja nadanych uprawnień:"
docker exec -it vm-mariadb bash -c "mysql -u root -pcrc2019 -e 'SELECT HOST,USER,PASSWORD,Select_priv FROM mysql.user'"
echo ""

echo "Odświeżenie uprawnień:"
docker exec -it vm-mariadb bash -c "mysql -u root -pcrc2019 -e 'flush privileges'"
echo ""

echo "Restart vm-mariadb oraz exp-mariadb:"
docker restart vm-mariadb exp-mariadb
echo ""

echo "Weryfikacja logów vm-mariadb:"
docker logs vm-mariadb
echo ""

echo "Weryfikacja logów exp-mariadb"
docker logs exp-mariadb
echo ""
echo ""
echo "--------------------- KONIEC ĆWICZENIA ---------------------"
echo ""
