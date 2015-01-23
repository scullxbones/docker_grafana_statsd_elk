ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure("2") do |config|
  ports = [80,81,8000,8126,9200,4560,6379].map { |p| ["-p","#{p}:#{p}"]  }.flatten

  config.vm.define "grafana_statsd_elk" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "."
      d.build_args = ["-t=scullxbones/grafana_statsd_elk"]
      d.create_args = ["-p","8125:8125/udp"].concat(ports)
      d.name = "grafana_statsd_elk-1"
      d.remains_running = true
      d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
    end
  end
end
