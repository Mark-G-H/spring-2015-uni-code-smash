# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'shopkeep-dev'

  config.vm.box = "hashicorp/precise32"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.synced_folder ".", "/home/vagrant/#{File.basename(Dir.pwd)}"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "1024"
  end

  # Native packages
  config.vm.provision :shell, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y \
      build-essential \
      curl \
      git \
      vim \
      python-pygments \
      node
  SHELL

  # RVM and Ruby
  config.vm.provision :shell, path: 'scripts/install-rvm.sh',  args: 'stable', privileged: false
  config.vm.provision :shell, path: 'scripts/install-ruby.sh', args: '2.2.2 uni-code-smash bundle', privileged: false
end
