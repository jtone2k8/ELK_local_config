# ELK_local_config

.yml files for faster local config

Working with ELK 7.8 and Kali 2020 (Should work on any Debian Distribution)

Installation  of ELK part takes 5 minutes or less, if setting up a fresh copy of kali(deb) updates may take 10+ minutes to complete.

## Installation
```
  git clone https://github.com/jtone2k8/ELK_local_config
  
  cd ELK_local_config
  chmod +x kali_elkstack_script.sh
  ./kali_elkstack_script.sh
```

## What the script does

update system

remove old packages

ELK

install elasticsearch public key

install elasticsearch repo

install elasticsearch kibana logstash

pull ELK configs from this repo

move the existing elasticsearch.yml to elasticsearch.yml.bk

copy elasticsearch.yml from git clone to /etc/elasticsearch

start and enable elasticsearch

move kibana.yml to kibana.yml.bk

copy kibana.yml from git clone to /etc/kibana.yml

start and enable kibana

move logstash.yml to logstash.yml.bk

copy logstash.yml from git clone to /etc/logstash.yml

start and enable logstash

check the status of elk
