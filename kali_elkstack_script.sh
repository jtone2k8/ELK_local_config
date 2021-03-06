#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
#remove old
sudo apt autoremove -y
## ELK
# install public key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
#install repo
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
#install apps
sudo apt-get update && sudo apt-get install elasticsearch kibana logstash -y
#pull ELK configs
git clone https://github.com/jtone2k8/ELK_local_config
#copy elasticsearch.yml
sudo mv /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.bk
sudo cp ELK_local_config/elasticsearch.yml /etc/elasticsearch/
#start and enable elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch
#copy kibana.yml
sudo mv /etc/kibana/kibana.yml /etc/kibana/kibana.yml.bk
sudo cp ELK_local_config/kibana.yml /etc/kibana/
#start and enable kibana
sudo systemctl enable kibana
sudo systemctl start kibana
#copy logstash.yml
sudo cp /etc/logstash/logstash.yml /etc/logstash/logstash.yml.bk
sudo cp ELK_local_config/logstash.yml /etc/logstash/
#start and enable logstash
#sudo systemctl enable logstash
#sudo systemctl start logstash
#status of elk
sudo systemctl status elasticsearch kibana logstash
