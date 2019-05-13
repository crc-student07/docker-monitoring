#!/bin/bash
echo "Create njmon and nmon database:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=CREATE DATABASE "nmon"'
echo "--------------------------------------------------"
echo "Show databases:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW DATABASES' | jq '.'
echo "--------------------------------------------------"
echo "Create njmon, nmon user:"
curl "http://vm-influxdb:8086/query" --data-urlencode "q=CREATE USER nmon WITH PASSWORD 'crc2019'" | jq '.'
echo "--------------------------------------------------"
echo "Give proper credentials for njmon and nmon user:"
curl "http://vm-influxdb:8086/query" --data-urlencode "q=GRANT ALL ON njmon TO nmon" | jq '.'
echo "--------------------------------------------------"
echo "Show users:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW USERS' | jq '.'
echo "--------------------------------------------------"
echo "Show credentials for njmon and nmon user:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW GRANTS FOR nmon' | jq '.'
echo "--------------------------------------------------"
