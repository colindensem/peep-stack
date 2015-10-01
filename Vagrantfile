# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below.
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder ".", "/vagrant",
    id: "core",
    :nfs => true,
    :mount_options => ['actimeo=2'],
    :mount_options => ['udp,fsc'],
    :mount_options => ['nolock,vers=3,noatime']
  # config.vm.synced_folder ".", "/vagrant", type: "nfs"
  # Windows: https://docs.vagrantup.com/v2/synced-folders/nfs.html

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.74.74"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.network "forwarded_port", guest: 35729, host: 35729
  config.vm.network "forwarded_port", guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 49152, host: 49152
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  config.vm.provision :docker
  config.vm.provision :docker_compose,
     yml: "/vagrant/docker-compose.yml",
     #rebuild: true,
     run: "always"

  config.vm.provider :virtualbox do |v|

    host = RbConfig::CONFIG['host_os']

    # Give VM 25% system memory & all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
  end

end
