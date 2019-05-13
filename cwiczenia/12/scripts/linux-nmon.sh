echo "Create dashboard - Linux NMON CRC"
echo""
curl -X POST -H "Content-Type: application/json" -d '{
    "dashboard": {
      "id": null,
      "title": "Linux Servers - NMON",
      "tags": [
        "OS",
        "Linux",
        "NMON",
        "CMAS",
        "SYSP"
      ],
      "timezone": "browser",
      "panels": [
        {
          "aliasColors": {},
          "bars": true,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 0,
            "y": 0
          },
          "id": 2,
          "leftYAxisLabel": "%",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "CPU_ALL",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/Idle%|Sys%|User%|Wait%/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host cpu total",
          "tooltip": {
            "msResolution": false,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {
            "Runnable ": "#f9934e"
          },
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 10,
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 12,
            "y": 0
          },
          "id": 4,
          "leftYAxisLabel": "# threads",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": true,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "PROC",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/Runnable/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host run queue",
          "tooltip": {
            "msResolution": false,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "cacheTimeout": null,
          "colorBackground": false,
          "colorValue": false,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "datasource": "NMON",
          "decimals": 2,
          "format": "decmbytes",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "gridPos": {
            "h": 8,
            "w": 6,
            "x": 0,
            "y": 11
          },
          "id": 31,
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
          "postfix": "",
          "postfixFontSize": "50%",
          "prefix": "",
          "prefixFontSize": "50%",
          "rangeMaps": [
            {
              "from": "null",
              "text": "N/A",
              "to": "null"
            }
          ],
          "sparkline": {
            "fillColor": "#3f6833",
            "full": false,
            "lineColor": "#bf1b00",
            "show": true
          },
          "tableColumn": "",
          "targets": [
            {
              "dsType": "influxdb",
              "groupBy": [
                {
                  "params": [
                    "$interval"
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
              "measurement": "MEM",
              "orderByTime": "ASC",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=",
                  "value": "memfree"
                }
              ]
            }
          ],
          "thresholds": "0",
          "title": "free memory",
          "type": "singlestat",
          "valueFontSize": "80%",
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
          "colorValue": false,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "datasource": "NMON",
          "decimals": 2,
          "format": "decmbytes",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "gridPos": {
            "h": 8,
            "w": 6,
            "x": 6,
            "y": 11
          },
          "id": 32,
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
          "postfix": "",
          "postfixFontSize": "50%",
          "prefix": "",
          "prefixFontSize": "50%",
          "rangeMaps": [
            {
              "from": "null",
              "text": "N/A",
              "to": "null"
            }
          ],
          "sparkline": {
            "fillColor": "#3f6833",
            "full": false,
            "lineColor": "#bf1b00",
            "show": true
          },
          "tableColumn": "",
          "targets": [
            {
              "dsType": "influxdb",
              "groupBy": [
                {
                  "params": [
                    "$interval"
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
              "measurement": "MEM",
              "orderByTime": "ASC",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=",
                  "value": "swapfree"
                }
              ]
            }
          ],
          "thresholds": "",
          "title": "free swap",
          "type": "singlestat",
          "valueFontSize": "80%",
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
            "nr_dirty": "#c15c17",
            "nr_mapped": "#629e51",
            "nr_page_table_pages": "#3f2b5b",
            "nr_slab": "#f2c96d",
            "nr_unstable": "#58140c"
          },
          "cacheTimeout": null,
          "combine": {
            "label": "Others",
            "threshold": 0
          },
          "datasource": "NMON",
          "fontSize": "80%",
          "format": "decmbytes",
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 11
          },
          "id": 34,
          "interval": null,
          "legend": {
            "percentage": true,
            "show": true,
            "values": true
          },
          "legendType": "Right side",
          "links": [],
          "maxDataPoints": 3,
          "nullPointMode": "connected",
          "pieType": "pie",
          "strokeWidth": 1,
          "targets": [
            {
              "alias": "$tag_name",
              "groupBy": [
                {
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "measurement": "VM",
              "orderByTime": "ASC",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/^nr_dirty$|^nr_mapped$|^nr_page_table_pages$|^nr_slab$|^nr_unstable$|^nr_writeback$/"
                }
              ]
            }
          ],
          "title": "$host memory nr",
          "type": "grafana-piechart-panel",
          "valueName": "avg"
        },
        {
          "aliasColors": {
            "active ": "#ef843c",
            "cached ": "#1f78c1",
            "inactive ": "#7eb26d",
            "memtotal ": "rgb(255, 236, 36)"
          },
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 1,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 19
          },
          "id": 27,
          "leftYAxisLabel": "MB",
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "active ",
              "yaxis": 1
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": true,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "MEM",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/^active$|^memtotal$|^cached$|^inactive$/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host memory usage",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
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
              "format": "decmbytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "fill": 1,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 19
          },
          "id": 36,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_name",
              "groupBy": [
                {
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "measurement": "MEM",
              "orderByTime": "ASC",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/^memtotal$|^active$|^memfree$|^memshared$|^buffers$|^cached$|^inactive$/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host memory usage details",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "transparent": false,
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
              "format": "decmbytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 1,
          "gridPos": {
            "h": 8,
            "w": 24,
            "x": 0,
            "y": 29
          },
          "id": 7,
          "leftYAxisLabel": "%",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "MEM",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/^swaptotal$|^swapcached$|^swapfree$/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host swap",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 1,
            "value_type": ""
          },
          "transparent": true,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "fill": 2,
          "gridPos": {
            "h": 16,
            "w": 24,
            "x": 0,
            "y": 37
          },
          "id": 38,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_name",
              "groupBy": [
                {
                  "params": [
                    "15m"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "measurement": "VM",
              "orderByTime": "ASC",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/pgactivate|pgalloc_dma|pgalloc_high|pgalloc_normal|pgdeactivate|pgfault|pgfree|pginodesteal|pgmajfault|pgpgin|pgpgout|pgrefill_dma|pgrefill_high|pgrefill_normal|pgrotated|pgscan_direct_dma|pgscan_direct_high|pgscan_direct_normal|pgscan_kswapd_dma|pgscan_kswapd_high|pgscan_kswapd_normal|pgsteal_dma|pgsteal_high|pgsteal_normal/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host paging details",
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
              "format": "deckbytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 53
          },
          "id": 11,
          "leftYAxisLabel": "KB/s",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/read/",
              "fill": 0,
              "stack": false,
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "NET",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/KB/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host network I/O",
          "tooltip": {
            "msResolution": false,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 13,
            "w": 24,
            "x": 0,
            "y": 60
          },
          "id": 12,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": false,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "NETPACKET",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host network packet",
          "tooltip": {
            "msResolution": false,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 1,
          "gridPos": {
            "h": 16,
            "w": 11,
            "x": 0,
            "y": 73
          },
          "id": 13,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "NETERROR",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host network errors",
          "tooltip": {
            "msResolution": false,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 16,
            "w": 13,
            "x": 11,
            "y": 73
          },
          "id": 14,
          "leftYAxisLabel": "%",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "max": true,
            "min": false,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name $tag_command ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                },
                {
                  "params": [
                    "command"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "TOP",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/%CPU/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host top processes",
          "tooltip": {
            "msResolution": false,
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "columns": [],
          "content": "",
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 0,
          "fontSize": "100%",
          "gridPos": {
            "h": 12,
            "w": 24,
            "x": 0,
            "y": 89
          },
          "id": 15,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "mode": "",
          "pageSize": 20,
          "scroll": true,
          "showHeader": true,
          "sort": {
            "col": 2,
            "desc": true
          },
          "stack": false,
          "style": {},
          "styles": [
            {
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "link": false,
              "pattern": "Time",
              "type": "date"
            },
            {
              "colorMode": null,
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "decimals": 2,
              "pattern": "/.*/",
              "thresholds": [],
              "type": "number",
              "unit": "short"
            }
          ],
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "params": [
                    "15m"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": [
                "name"
              ],
              "hide": false,
              "measurement": "JFSFILE",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                }
              ],
              "transform": "timeseries_to_columns"
            }
          ],
          "title": "Filespace %Used",
          "tooltip": {
            "value_type": ""
          },
          "transform": "timeseries_to_columns",
          "type": "table"
        },
        {
          "aliasColors": {
            "sda ": "#eab839",
            "sda1 ": "#b7dbab",
            "sda2 ": "#1f78c1",
            "sdb ": "#ba43a9"
          },
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 0,
            "y": 101
          },
          "id": 16,
          "leftYAxisLabel": "KB/s",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "DISKREAD",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/^sd*/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host disk read KB/s",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": ""
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {
            "sda ": "#eab839",
            "sda1 ": "#b7dbab",
            "sda2 ": "#1f78c1",
            "sdb ": "#ba43a9"
          },
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 12,
            "y": 101
          },
          "id": 18,
          "leftYAxisLabel": "KB/s",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "DISKWRITE",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/sd*/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host disk write KB/s",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": ""
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {
            "sda ": "#eab839",
            "sda1 ": "#b7dbab",
            "sda2 ": "#1f78c1",
            "sdb ": "#ba43a9"
          },
          "bars": false,
          "content": "",
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "editable": true,
          "error": false,
          "fill": 2,
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 0,
            "y": 112
          },
          "id": 21,
          "leftYAxisLabel": "xfers/s",
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "mode": "",
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "style": {},
          "targets": [
            {
              "alias": "$tag_name ",
              "dsType": "influxdb",
              "function": "mean",
              "groupBy": [
                {
                  "interval": "auto",
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "groupByTags": null,
              "hide": false,
              "measurement": "DISKXFER",
              "orderByTime": "ASC",
              "policy": "default",
              "query": "",
              "rawQuery": false,
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/sd*/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host disk transfers per second",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": ""
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
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {
            "sda": "#eab839",
            "sda1": "#b7dbab",
            "sda2": "#1f78c1",
            "sdb": "#ba43a9"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "NMON",
          "fill": 2,
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 12,
            "y": 112
          },
          "id": 40,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "$tag_name",
              "groupBy": [
                {
                  "params": [
                    "auto"
                  ],
                  "type": "time"
                },
                {
                  "params": [
                    "name"
                  ],
                  "type": "tag"
                }
              ],
              "measurement": "DISKBUSY",
              "orderByTime": "ASC",
              "policy": "default",
              "refId": "A",
              "resultFormat": "time_series",
              "select": [
                [
                  {
                    "params": [
                      "value"
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
                  "value": "/^$host$/"
                },
                {
                  "condition": "AND",
                  "key": "name",
                  "operator": "=~",
                  "value": "/sd*/"
                }
              ]
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "$host disk busy %",
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
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        }
      ],
      "templating": {
        "list": [
          {
            "allValue": null,
            "datasource": "NMON",
            "hide": 0,
            "includeAll": false,
            "label": null,
            "multi": false,
            "name": "host",
            "options": [],
            "query": "show tag values from \"CPU_ALL\" with key = \"host\"",
            "refresh": 1,
            "regex": "",
            "sort": 0,
            "tagValuesQuery": "",
            "tags": [],
            "tagsQuery": "",
            "type": "query",
            "useTags": false
          }
        ]
      },
      "timepicker": {
        "hidden": false,
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
      "overwrite": false
}}' http://admin:crc2019@vm-grafana:3000/api/dashboards/db
echo ""
