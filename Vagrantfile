Vagrant.configure("2") do |config|
	config.vm.box = "grafana_statsd_elk"
	config.vm.box_url = "http://files.vagrantup.com/trusty64.box"
	config.vm.provider :virtualbox do |virtualbox|
        virtualbox.customize ["modifyvm", :id, "--memory", "2048"]
        virtualbox.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      end
	config.vm.network :forwarded_port, host: 8888, guest: 80
	config.vm.network :forwarded_port, host: 8000, guest: 8000
	config.vm.network :forwarded_port, host: 8125, guest: 8125, protocol: 'udp'
	config.vm.network :forwarded_port, host: 8126, guest: 8126
	config.vm.network :forwarded_port, host: 9200, guest: 9200
	config.vm.network :forwarded_port, host: 9300, guest: 9300

	config.vm.provision "docker"
end
