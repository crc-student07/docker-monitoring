#!/bin/bash
echo "--------------------- POCZĄTEK ĆWICZENIA ---------------------"
echo ""
echo "####################################"
echo "# Cwiczenie 4 - Instalacja pluginu #"
echo "####################################"
echo ""
echo "Instaluje plugin:"
docker exec -it --user grafana vm-grafana bash -c 'grafana-cli plugins install raintank-worldping-app'
echo ""
echo "Restartuje kontener:"
docker restart vm-grafana
echo ""
echo "Sprawdzam status kontenera:"
docker ps | grep vm-grafana
docker logs vm-grafana
echo ""
echo "Sprawdzam czy plugin został poprawnie zainstalowany:"
docker exec -it --user grafana vm-grafana bash -c 'grafana-cli plugins ls'
echo ""
echo ""
echo "--------------------- KONIEC ĆWICZENIA ---------------------"
echo ""
