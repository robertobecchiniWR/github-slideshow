FROM ubuntu:18.04

#Install Jenkins
RUN apt-get update
RUN apt-get install -y apt-transport-https 
RUN apt-get install -y software-properties-common  
RUN apt-get install -y wget

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

RUN add-apt-repository universe
RUN apt-get update

RUN apt-get install -y jenkins

#Install influxDB
RUN wget -q -O - https://repos.influxdata.com/influxdb.key | apt-key add - 

RUN . /etc/lsb-release
     
RUN echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | tee /etc/apt/sources.list.d/influxdb.list

RUN apt-get update && apt-get install -y influxdb
RUN export INFLUXDB_CONFIG_PATH="/etc/influxdb/influxdb.conf"
RUN service influxdb start
	
#RUN influxd -config /etc/influxdb/influxdb.conf
#RUN influxd

#Install Grafana
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
	
RUN echo "deb https://packages.grafana.com/enterprise/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list

RUN apt-get update
RUN apt-get install -y grafana-enterprise

#Install graphviz
RUN apt install graphviz

#Install Java
#RUN apt-get update && apt-get install -y openjdk-8-jre-headless
