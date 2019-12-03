# elasticsearch-server

This repository contains configuration to run elastic search server by loading provided dynamic index templates.

## Upload templates

### Supported format

We do support `JSON` format for template configuration

**Example**

```json
{
  "name": "my_template_name",
  "template": {
    "order": 0,
    "index_patterns": ["my_index_pattern*"],
    "settings": {
      "index": {
        "number_of_shards": "5",
        "number_of_replicas": "1"
      }
    },
    "mappings": {
      "doc": {
        "properties": {
          "backend_event_dtime": {
            "type": "date",
            "format": "dd-MM-yyyy HH:mm:ss"
          },
          "campaign_id": {
            "type": "keyword"
          },
          "client_id": {
            "type": "keyword"
          },
          "external_ips": {
            "type": "keyword"
          },
          "frontend_event_dtime": {
            "type": "date",
            "format": "dd-MM-yyyy HH:mm:ss"
          }
        }
      }
    },
    "aliases": {}
  }
}
```

Place above JSON format files to

`/usr/share/elasticsearch/templates`

Folder and all `JSON` file will be loaded automatically to the server.
