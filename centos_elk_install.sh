#/bin/bash

#update system
sudo yum update -y

#install pre-reqs
sudo yum install git -y

#get the PGP key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Create elasticsearch.repo @ /etc/yum.repos.d/
sudo touch /etc/yum.repos.d/elasticsearch.repo
echo "[elasticsearch]" | sudo tee /etc/yum.repos.d/elasticsearch.repo
echo "name=Elasticsearch repository for 7.x packages" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo
echo "baseurl=https://artifacts.elastic.co/packages/7.x/yum" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo
echo "gpgcheck=1" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo
echo "gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo
echo "enabled=0" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo
echo "autorefresh=1" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo
echo "type=rpm-md" | sudo tee -a /etc/yum.repos.d/elasticsearch.repo

#enable the repo and install elasticsearch & Kibana
sudo yum install --enablerepo=elasticsearch elasticsearch kibana logstash -y

#Copy Github with configs
sudo git clone https://github.com/jtone2k8/ELK_local_config

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
© 2021 GitHub, Inc.
