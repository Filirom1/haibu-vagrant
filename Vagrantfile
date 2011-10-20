Vagrant::Config.run do |config|
  # A long ssh timeout, so we can do a `sudo dhclient` after the VM start
  config.ssh.max_tries = 150

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"

  # Boot with a GUI so you can see the screen. (Default is headless)
  config.vm.boot_mode = :gui

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port "haibu", 9002, 9002
  config.vm.forward_port "app1", 8001, 8001
  config.vm.forward_port "app2", 8002, 8002
  config.vm.forward_port "app3", 8003, 8003
  config.vm.forward_port "app4", 8004, 8004
  config.vm.forward_port "app5", 8005, 8005



  # Enable and configure the chef solo provisioner
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe("build-essential")
    chef.add_recipe("nodejs")
    chef.add_recipe("nodejs::npm")
    chef.add_recipe("haibu")
    chef.add_recipe("git")
  end

end
