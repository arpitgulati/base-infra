Ansible Filebeat role
=========

Installs Elastic's Filebeat for forwarding logs.

Role Variables
--------------

 - `filebeat_version` - The version of filebeat to install. Defaults to `1.3.1`.
 - `filebeat_config` - YAML representation of your filebeat config. This is templated directly into the configuration file as YAML. See the [example configuration](https://github.com/elastic/beats/blob/master/filebeat/filebeat.full.yml) for an exhaustive list of configuration options. Defaults to:

  ``` yaml
  filebeat_config:
    filebeat:
      prospectors:
        - paths:
            - /var/log/messages
            - /var/log/*.log
          input_type: log
    output:
      file:
        path: /tmp/filebeat
        filename: filebeat
    logging:
      to_syslog: true
      level: error
  ```
 - `filebeat_ca_cert` - If provided, the contents of this variable will be placed into the file identified by `filebeat_ca_path` on the target host. You can then include the `filebeat_ca_path` within your configuration to properly authenticate your TLS connections to Logstash/Elasticsearch/etc.
 
  If you wish to load your CA certificate from a file, use the `file` lookup plugin, e.g.:
  ``` yaml
  filebeat_ca_cert: "{{ lookup('file', '/path/to/ca.crt') }}"
  ```
 - `filebeat_ca_path` - If a CA certificate is provided in `filebeat_ca_cert`, it will be created at this path. 

You can also store the config in separate `filebeat.yml` file and include it using [lookup](http://docs.ansible.com/ansible/playbooks_lookups.html#intro-to-lookups-getting-file-contents):

``` yaml
filebeat_config: "{{ lookup('file', './filebeat.yml')|from_yaml }}"
```

Common Configurations
---------------------

Connecting to Elasticsearch:

  ``` yaml
  filebeat_config:
    filebeat:
      prospectors:
        - paths:
            - /var/log/messages
            - /var/log/*.log
          input_type: log
    output:
      elasticsearch:
        hosts:
          - "http://localhost:9200"
        username: "bob"
        password: "12345"
    logging:
      to_syslog: true
      level: error
  ```

Kafka filebeat Variables
--------------

 - `filebeat_kafka_enabled` - To enable kafka filebeat set it to `true`.
 - `filebeat_kafka_config` - YAML representation of your kafka output filebeat config. This is templated directly into the configuration file as YAML. See the [example configuration](https://github.com/elastic/beats/blob/master/filebeat/filebeat.full.yml) for an exhaustive list of configuration options. Defaults to:
 - `kafka_brokers` - YAML representation of your filebeat config. This is templated directly into the configuration file as YAML. See the [example configuration](https://github.com/elastic/beats/blob/master/filebeat/filebeat.full.yml) for an exhaustive list of configuration options. Defaults to:

  ``` yaml
    filebeat_kafka_config:
      filebeat:
        prospectors:
        - paths:
          - /var/log/fynd/kafka/trace_meta.json
          encoding: utf-8
          fields:
            type: kafka
          fields_under_root: true
          ignore_older: 8h
          json.add_error_key: true
          json.keys_under_root: true
        registry_file: /var/lib/filebeat/kafka_registry
      logging.files:
        keepfiles: 50
        name: filebeat_kafka.log
        path: /var/log/filebeat
        permissions: 384
        rotateeverybytes: 10485760
      logging.json: true
      logging.level: error
      logging.metrics.enabled: true
      logging.metrics.period: 30s
      logging.to_files: true
      output:
        kafka:
          # initial brokers for reading cluster metadata
          enabled: true
          hosts: "{{kafka_brokers}}"
    
          # message topic selection + partitioning
          topic: '%{[fields.log_topic]}'
          partition.round_robin:
            reachable_only: false
          required_acks: 1
          compression: gzip
          max_message_bytes: 1000000
          metadata:
            retry.max: 1
  ```