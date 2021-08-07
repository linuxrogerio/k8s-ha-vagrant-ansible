# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'
IMAGE = "bento/ubuntu-20.04"

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Load Balancer Node
  config.vm.define "loadbalancer" do |lb|
    lb.vm.box = IMAGE
    lb.vm.hostname = "loadbalancer.example.com"
    lb.vm.network "private_network", ip: "172.16.16.100"
    lb.vm.provision "ansible" do |ansible|
      ansible.playbook = "k8s-setup/haproxy-playbook.yml"
      ansible.extra_vars = {
          node_ip: "172.16.16.100",
      }
  end


    lb.vm.provider "virtualbox" do |v|
      v.name = "loadbalancer"
      v.memory = 1024
      v.cpus = 1
    end
  end

  MasterCount = 2

  # Kubernetes Master Nodes
  (1..MasterCount).each do |i|
    config.vm.define "kmaster#{i}" do |masternode|
      masternode.vm.box = IMAGE
      masternode.vm.hostname = "kmaster#{i}.example.com"
      masternode.vm.network "private_network", ip: "172.16.16.10#{i}"
      masternode.vm.provision "ansible" do |ansible|
        ansible.playbook = "k8s-setup/master-playbook.yml"
        ansible.extra_vars = {
            node_ip: "172.16.16.10#{i}",
        }
    end

      masternode.vm.provider "virtualbox" do |v|
        v.name = "kmaster#{i}"
        v.memory = 2048
        v.cpus = 2
      end
    end
  end

  NodeCount = 1

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "kworker#{i}" do |workernode|
      workernode.vm.box = IMAGE
      workernode.vm.hostname = "kworker#{i}.example.com"
      workernode.vm.network "private_network", ip: "172.16.16.20#{i}"
      workernode.vm.provision "ansible" do |ansible|
        ansible.playbook = "k8s-setup/node-playbook.yml"
        ansible.extra_vars = {
            node_ip: "172.16.16.20#{i}",
        }
    end
      workernode.vm.provider "virtualbox" do |v|
        v.name = "kworker#{i}"
        v.memory = 1024
        v.cpus = 1
      end
    end
  end

end
