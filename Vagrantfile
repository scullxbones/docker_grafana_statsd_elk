ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure("2") do |config|
  config.vm.define "grafana_statsd_elk" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "."
      d.build_args = ["-t=scullxbones/grafana_statsd_elk"]
      d.ports = ["80:80","81:81","6379:6379","2003:2003","8000:8000","9200:9200","8125:8125/udp","4560:4560"]
      d.name = "grafana_statsd_elk"
      d.remains_running = true
      d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    end
  end
end
