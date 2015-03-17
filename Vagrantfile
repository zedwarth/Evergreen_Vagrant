IP = "192.168.1.250"
PREFIX = "/openils"

Vagrant.require_version ">= 1.7.2"

Vagrant.configure(2) do |config|
config.vm.box = 'ubuntu/trusty64'
config.vm.hostname = 'evergreen'
config.vm.network "public_network", ip: IP

config.vm.provision "shell" do |s|
	s.path = "provission.sh"
end

config.vm.post_up_message = "Access via #{IP}."


end
