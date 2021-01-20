#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
	  sleep 1
  done

  # install haxproxy
  sudo apt-get update
  sudo apt-get -y install haproxy
  sudo haproxy version
  sudo echo "frontend Local_Server
                 bind *:80
                 mode http
	         default_backend k8s_server

	     backend k8s_server
	         mode http
		 balance roundrobin
		 server web1.example.com  IP_VALUE:8080" > /etc/haproxy/haproxy.cfg
  sudo  haproxy -c -f /etc/haproxy/haproxy.cfg		 

  # make sure haproxy is started
  sudo service haxproxy restart

