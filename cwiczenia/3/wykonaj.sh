#!/bin/bash
echo "--------------------- POCZĄTEK ĆWICZENIA ---------------------"
echo ""
echo "####################################################################"
echo "# Cwiczenie 3 - Wczytanie konfiguracji dashboardów w notacji json. #"
echo "####################################################################"
echo ""
echo "Skopiuj grafy na vm-grafana:"
docker cp ../../grafana/dashboards/. vm-grafana:/var/lib/grafana/dashboards/
echo ""
echo "Zrestartuj kontener vm-grafana:"
docker restart vm-grafana
echo ""
echo "Sprawdzam status oraz logi kontenera vm-grafana:"
docker ps | grep vm-grafana
echo ""
docker logs vm-grafana
echo ""
echo ""
echo "--------------------- KONIEC ĆWICZENIA ---------------------"
echo ""
