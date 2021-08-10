# k8s-ha-vagrant-ansible
This repository was created to faster create a k8s cluster using vagrant and ansible - It's just for my studies, however make yourself confortable to make adjusts and improvements. :D


Vagrant Environment

|Role	          | FQDN	                   | IP	            | OS	          |RAM	|CPU|
----------------|--------------------------|----------------|---------------|-----|---|
|Load Balancer	| loadbalancer.example.com |	172.16.16.100	| Ubuntu 20.04	|1G	  |1  |
|Master	        | kmaster1.example.com	   |  172.16.16.101	| Ubuntu 20.04	|2G	  |2  |
|Master	        | kmaster2.example.com	   |  172.16.16.102	| Ubuntu 20.04	|2G	  |2  |
|Worker	        | kworker1.example.com	   |  172.16.16.201	| Ubuntu 20.04	|1G	  |1  |

Password for the root account on all these virtual machines is kubeadmin

Perform all the commands as root user unless otherwise specified


Pre-requisites
If you want to try this in a virtualized environment on your workstation

Virtualbox installed
Vagrant installed
Host machine has atleast 8 cores
Host machine has atleast 8G memory

Bring up all the virtual machines


