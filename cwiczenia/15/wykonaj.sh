echo "--------------------- POCZĄTEK ĆWICZENIA ---------------------"
echo ""
echo "##############################################################"
echo "# Cwiczenie 10 - Konfiguracja monitoringu dla serwera docker #"
echo "##############################################################"
echo ""
echo "--------------------------------------------------"
echo ""
echo "Cwiczenie 10.a - Utworzenie folderu na grafy"
curl -X POST -H "Content-Type: application/json" -d '{
  "id":"4",
  "uid": "aa2psaa864",
  "title": "CRC",
  "overwrite": true
}' http://$1:$2@vm-grafana:3000/api/folders
echo ""
echo "--------------------------------------------------"
echo ""
echo "Cwiczenie 10.b - Utworzenie źródła danych CRC-MONITOR"
curl -X POST -H "Content-Type: application/json" -d '{
  "id":1,
  "orgId":1,
  "name":"CRC-MONITOR",
  "type":"influxdb",
  "access":"proxy",
  "url":"http://vm-influxdb:8086",
  "password":"crc2019",
  "user":"monitor",
  "database":"monitor",
  "basicAuth":false,
  "basicAuthUser":"",
  "basicAuthPassword":"",
  "isDefault":false,
  "jsonData":null
}' http://$1:$2@vm-grafana:3000/api/datasources
echo ""
echo "--------------------------------------------------"
echo ""
echo "Cwiczenie 10.c - Tworzenie dashboardu CRC Cwiczenie 10"
curl -X POST -H "Content-Type: application/json" -d '{
"dashboard": {
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "id": null,
  "gnetId": null,
  "graphTooltip": 0,
  "iteration": 1551454121819,
  "links": [],
  "panels": [
    {
      "aliasColors": {},
      "breakPoint": "50%",
      "cacheTimeout": null,
      "combine": {
        "label": "Others",
        "threshold": ""
      },
      "datasource": "CRC-MONITOR",
      "description": "Summary pie graph",
      "fontSize": "100%",
      "format": "percent",
      "gridPos": {
        "h": 10,
        "w": 5,
        "x": 0,
        "y": 0
      },
      "id": 8,
      "interval": null,
      "legend": {
        "header": "",
        "percentage": false,
        "percentageDecimals": null,
        "show": true,
        "values": true
      },
      "legendType": "On graph",
      "links": [],
      "maxDataPoints": 3,
      "nullPointMode": "connected",
      "pieType": "donut",
      "strokeWidth": "1",
      "targets": [
        {
          "alias": "user",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "user"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=~",
              "value": "/^$HOST$/"
            }
          ]
        },
        {
          "alias": "sys",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "sys"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=",
              "value": "server1"
            }
          ]
        },
        {
          "alias": "idle",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "C",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "idle"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=",
              "value": "server1"
            }
          ]
        }
      ],
      "title": "CPU Summary",
      "type": "grafana-piechart-panel",
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorPostfix": false,
      "colorPrefix": false,
      "colorValue": false,
      "colors": [
        "#6ed0e0",
        "#ef843c",
        "#58140c"
      ],
      "datasource": "CRC-MONITOR",
      "description": "Single stat",
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": true,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 10,
        "w": 6,
        "x": 5,
        "y": 0
      },
      "id": 5,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "   cpu",
      "postfixFontSize": "80%",
      "prefix": "sys  ",
      "prefixFontSize": "80%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "#0a50a1",
        "full": false,
        "lineColor": "#58140c",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "alias": "user",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "sys"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=~",
              "value": "/^$HOST$/"
            }
          ]
        }
      ],
      "thresholds": "85,95",
      "title": "CPU - sys (single)",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorPostfix": false,
      "colorPrefix": false,
      "colorValue": false,
      "colors": [
        "#7eb26d",
        "#e5ac0e",
        "#bf1b00"
      ],
      "datasource": "CRC-MONITOR",
      "description": "Single stat",
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": true,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 10,
        "w": 6,
        "x": 11,
        "y": 0
      },
      "id": 6,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "   cpu",
      "postfixFontSize": "80%",
      "prefix": "idle    ",
      "prefixFontSize": "80%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "#c15c17",
        "full": false,
        "lineColor": "#58140c",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "alias": "user",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "idle"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=~",
              "value": "/^$HOST$/"
            }
          ]
        }
      ],
      "thresholds": "85,95",
      "title": "CPU - idle (single)",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorPostfix": false,
      "colorPrefix": false,
      "colorValue": false,
      "colors": [
        "#3f6833",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "CRC-MONITOR",
      "description": "Single stat",
      "format": "percent",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": true,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 10,
        "w": 6,
        "x": 17,
        "y": 0
      },
      "id": 4,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "   cpu",
      "postfixFontSize": "80%",
      "prefix": "user   ",
      "prefixFontSize": "80%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "#052b51",
        "full": false,
        "lineColor": "#58140c",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "alias": "user",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "null"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "user"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=~",
              "value": "/^$HOST$/"
            }
          ]
        }
      ],
      "thresholds": "85,95",
      "title": "CPU - user (single)",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "aliasColors": {
        "Idle": "#7eb26d",
        "Sys": "#f4d598",
        "User": "#890f02"
      },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "CRC-MONITOR",
      "decimals": null,
      "description": "Ćwiczenie 10 użycie CPU",
      "fill": 1,
      "gridPos": {
        "h": 10,
        "w": 24,
        "x": 0,
        "y": 10
      },
      "id": 2,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": true,
        "min": true,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 2,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 2,
      "points": true,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "alias": "User",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "none"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "A",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "user"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=~",
              "value": "/^$HOST$/"
            }
          ]
        },
        {
          "alias": "Sys",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "none"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "B",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "sys"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=",
              "value": "server1"
            }
          ]
        },
        {
          "alias": "Idle",
          "expr": "",
          "format": "time_series",
          "groupBy": [
            {
              "params": [
                "1m"
              ],
              "type": "time"
            },
            {
              "params": [
                "none"
              ],
              "type": "fill"
            }
          ],
          "intervalFactor": 1,
          "measurement": "cpu",
          "orderByTime": "ASC",
          "policy": "default",
          "refId": "C",
          "resultFormat": "time_series",
          "select": [
            [
              {
                "params": [
                  "idle"
                ],
                "type": "field"
              },
              {
                "params": [],
                "type": "mean"
              }
            ]
          ],
          "tags": [
            {
              "key": "host",
              "operator": "=",
              "value": "server1"
            }
          ]
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "CPU",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "decimals": 1,
          "format": "percent",
          "label": "Procent",
          "logBase": 1,
          "max": "150",
          "min": "0",
          "show": true
        },
        {
          "decimals": null,
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": false,
  "schemaVersion": 16,
  "style": "dark",
  "tags": [
    "CRC",
    "Asystent"
  ],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {
          "tags": [],
          "text": "server8",
          "value": "server8"
        },
        "datasource": "CRC-MONITOR",
        "definition": "SHOW TAG VALUES WITH KEY = \"host\"",
        "hide": 0,
        "includeAll": false,
        "label": "host",
        "multi": false,
        "name": "HOST",
        "options": [
          {
            "selected": false,
            "text": "server1",
            "value": "server1"
          },
          {
            "selected": false,
            "text": "server10",
            "value": "server10"
          },
          {
            "selected": false,
            "text": "server2",
            "value": "server2"
          },
          {
            "selected": false,
            "text": "server3",
            "value": "server3"
          },
          {
            "selected": false,
            "text": "server4",
            "value": "server4"
          },
          {
            "selected": false,
            "text": "server5",
            "value": "server5"
          },
          {
            "selected": false,
            "text": "server6",
            "value": "server6"
          },
          {
            "selected": false,
            "text": "server7",
            "value": "server7"
          },
          {
            "selected": true,
            "text": "server8",
            "value": "server8"
          },
          {
            "selected": false,
            "text": "server9",
            "value": "server9"
          }
        ],
        "query": "SHOW TAG VALUES WITH KEY = \"host\"",
        "refresh": 0,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "2019-03-01T10:26:52.246Z",
    "to": "2019-03-01T11:03:51.424Z"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "CRC - Cwiczenie 10",
  "uid": "i8OUKeriz",
  "version": 9
  }
}' http://$1:$2@vm-grafana:3000/api/dashboards/db
echo ""
echo ""
echo "--------------------- KONIEC ĆWICZENIA ---------------------"
echo ""
