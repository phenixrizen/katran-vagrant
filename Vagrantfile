# Ubuntu 18.04

# Vagrant version
Vagrant.configure("2") do |config|
  # Setup virtual hardware
  config.vm.provider "hyperv" do |h|
    h.cpus = 4
    h.memory = 4096
  end
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 4096
  end

  # Base image (Ubuntu 18.04)
  config.vm.box = "hashicorp/bionic64"
  
  # Setup the shared mount
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Disable updates
  config.vm.box_check_update = false

  # Start initial script
  config.vm.provision "shell", path: "bootstrap.sh"

  # Forward ports 
  # In this box we forward standart ports for HTTP (80) and HTTPS (443)
  config.vm.network "forwarded_port", host: 80, guest: 80, id: "http"
  config.vm.network "forwarded_port", host: 443, guest: 443, id: "https"
  
  # Show message after a successful run
  config.vm.post_up_message = "Virtual machine is ready to work!"
end