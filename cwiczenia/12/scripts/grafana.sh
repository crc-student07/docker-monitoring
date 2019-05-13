#!/bin/bash
echo "Create InfluxDB data source for njmon stream:"
curl -X POST -H "Content-Type: application/json" -d '{ "id":1, "orgId":1, "name":"NMON", "type":"influxdb", "access":"proxy", "url":"http://vm-influxdb:8086", "password":"", "user":"", "database":"nmon", "basicAuth":false, "basicAuthUser":"", "basicAuthPassword":"", "isDefault":false, "jsonData":null }' http://admin:crc2019@vm-grafana:3000/api/datasources
echo ""
echo "--------------------------------------------------"
echo "Install clock panel:"
docker exec -it vm-grafana bash -c 'grafana-cli plugins install grafana-clock-panel'
#docker exec -it vm-grafana bash -c 'grafana-cli plugins install grafana-piechart-panel'
echo "--------------------------------------------------"
