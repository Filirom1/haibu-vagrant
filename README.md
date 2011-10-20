An Haibu VM, the fist step to the cloud !
=========================================

Do you want to test [haibu](https://github.com/nodejitsu/haibu) in a VM ?

Or simply to create a lot of VMs to deploy your node-js apps easily?

This repository can help you.

### Run Haibu VMs vith Vagrant

Thanks to [Vagrant](http://vagrantup.com/), you will be able to run
haibu in a VM simply by executing those command lines : 

    $ gem install vagrant
    $ vagrant box add base http://files.vagrantup.com/lucid32.box
    $ git clone https://github.com/Filirom1/haibu-vagrant.git haibu-vagrant
    $ cd haibu-vagrant
    $ vagrant up

Now vagrant will install nodejs, npm, git and haibu on the VM.


### Deploy your app

If everythings is ok, you can deploy your app to haibu.

    $ [sudo] npm install -g haibu
    $ cd apps/chat
    $ haibu start
    info: Using config file /home/romain/cloud/.haibuconf
    warn: No deployment script was detected
    info: haibu-server located at 127.0.0.1:9002
    info: Successfully started app: chat on 0.0.0.0:8001
    
    $ chromium http://localhost:8001


### How does it works

Vagrant download an empty VM image, then it install every dependencies
declared in the VagrantFile.

The dependecies are written as [chef](http://www.opscode.com/chef/) cookbooks and every recipes
needed for this example are in the folder `cookbooks`. You can look at
the haibu recipe, it's mine :) Very easy to do !!!
If you need more examples look at :
<https://github.com/opscode/cookbooks>, or <https://github.com/mdxp/cookbooks/tree/master/nodejs>

So when the VM starts, everything is installed, and every services are
launched.

In the VagrantFile, forwarding port is configured, so you can do an HTTP
GET on port 9002.


### Fix a Vagrant freeze

If your log freeze on `Waiting for VM to boot. This can take a few minutes.`, don't worry.
In VirtualBox, enter `vagrant` as login and `vagrant` as password.
Now in the shell enter

    $ sudo dhclient


The full log should looks like this :

    [romain@dahu cloud]$ vagrant up
    [default] Importing base box 'base'...
    [default] The guest additions on this VM do not match the install version of
    VirtualBox! This may cause things such as forwarded ports, shared
    folders, and more to not work properly. If any of those things fail on
    this machine, please update the guest additions and repackage the
    box.

    Guest Additions Version: 4.1.0
    VirtualBox Version: 4.1.4_OSE
    [default] Matching MAC address for NAT networking...
    [default] Clearing any previously set forwarded ports...
    [default] Forwarding ports...
    [default] -- ssh: 22 => 2222 (adapter 1)
    [default] -- http: 8005 => 8005 (adapter 1)
    [default] Creating shared folders metadata...
    [default] Running any VM customizations...
    [default] Booting VM...
    [default] Waiting for VM to boot. This can take a few minutes.
    [default] VM booted and ready for use!
    [default] Mounting shared folders...
    [default] -- v-root: /vagrant
    [default] -- v-csc-1: /tmp/vagrant-chef-1/chef-solo-1
    [default] Running provisioner: Vagrant::Provisioners::ChefSolo...
    [default] Generating chef JSON and uploading...
    [default] Running chef-solo...
    [default] stdin: is not a tty
    : stderr
    [default] [Wed, 19 Oct 2011 16:54:52 -0700] INFO: *** Chef 0.10.2 ***
    : stdout
    [default] [Wed, 19 Oct 2011 16:54:53 -0700] INFO: Setting the run_list to ["recipe[build-essential]", "recipe[nodejs]", "recipe[nodejs::npm]", "recipe[haibu]", "recipe[git]"] from JSON
    : stdout
    [default] [Wed, 19 Oct 2011 16:54:53 -0700] INFO: Run List is [recipe[build-essential], recipe[nodejs], recipe[nodejs::npm], recipe[haibu], recipe[git]]
    : stdout
    [default] [Wed, 19 Oct 2011 16:54:53 -0700] INFO: Run List expands to [build-essential, nodejs, nodejs::npm, haibu, git]
    : stdout
    [default] [Wed, 19 Oct 2011 16:54:53 -0700] INFO: Starting Chef Run for lucid32
    : stdout
    [default] [Wed, 19 Oct 2011 16:54:53 -0700] INFO: Processing package[build-essential] action install (build-essential::default line 23)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:11 -0700] INFO: package[build-essential] installed version 11.4build1
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:11 -0700] INFO: Processing package[binutils-doc] action install (build-essential::default line 23)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:16 -0700] INFO: package[binutils-doc] installed version 2.20.1-3ubuntu7.1
    [Wed, 19 Oct 2011 16:55:16 -0700] INFO: Processing package[autoconf] action install (build-essential::default line 35)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:25 -0700] INFO: package[autoconf] installed version 2.65-3ubuntu1
    [Wed, 19 Oct 2011 16:55:25 -0700] INFO: Processing package[flex] action install (build-essential::default line 39)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:30 -0700] INFO: package[flex] installed version 2.5.35-9
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:30 -0700] INFO: Processing package[bison] action install (build-essential::default line 43)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:33 -0700] INFO: package[bison] installed version 1:2.4.1.dfsg-3
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:33 -0700] INFO: Processing package[libssl-dev] action install (nodejs::default line 27)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:34 -0700] INFO: Processing bash[install nodejs from source] action run (nodejs::default line 30)
    : stdout
    [default] [Wed, 19 Oct 2011 16:55:34 -0700] INFO: bash[install nodejs from source] sh("bash"  "/tmp/chef-script20111019-979-1b4tgo1-0")
    : stdout
    [default] [Wed, 19 Oct 2011 17:00:24 -0700] INFO: bash[install nodejs from source] ran successfully
    : stdout
    [default] [Wed, 19 Oct 2011 17:00:24 -0700] INFO: Processing package[curl] action install (nodejs::npm line 23)
    : stdout
    [default] [Wed, 19 Oct 2011 17:00:29 -0700] INFO: package[curl] installed version 7.19.7-1ubuntu1.1
    : stdout
    [default] [Wed, 19 Oct 2011 17:00:29 -0700] INFO: Processing bash[install npm - package manager for node] action run (nodejs::npm line 25)
    : stdout
    [default] [Wed, 19 Oct 2011 17:00:29 -0700] INFO: bash[install npm - package manager for node] sh("bash"  "/tmp/chef-script20111019-979-bkx1q7-0")
    : stdout
    [default] [Wed, 19 Oct 2011 17:01:29 -0700] INFO: bash[install npm - package manager for node] ran successfully
    : stdout
    [default] [Wed, 19 Oct 2011 17:01:29 -0700] INFO: Processing bash[install haibu - application server for node] action run (haibu::default line 22)
    : stdout
    [default] [Wed, 19 Oct 2011 17:01:29 -0700] INFO: bash[install haibu - application server for node] sh("bash"  "/tmp/chef-script20111019-979-1uvkp2i-0")
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:20 -0700] INFO: bash[install haibu - application server for node] ran successfully
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:20 -0700] INFO: Processing execute[start-runsvdir] action nothing (runit::default line 22)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:20 -0700] INFO: Processing execute[runit-hup-init] action nothing (runit::default line 31)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:20 -0700] INFO: Processing package[runit] action install (runit::default line 44)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:21 -0700] INFO: Processing cookbook_file[/tmp/vagrant-chef-1/preseed/runit/runit-2.0.0-1ubuntu4.seed] action create (dynamically defined)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:21 -0700] INFO: cookbook_file[/tmp/vagrant-chef-1/preseed/runit/runit-2.0.0-1ubuntu4.seed] created file /tmp/vagrant-chef-1/preseed/runit/runit-2.0.0-1ubuntu4.seed
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:21 -0700] INFO: package[runit] pre-seeding package installation instructions
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: package[runit] installed version 2.0.0-1ubuntu4
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: package[runit] sending nothing action to execute[start-runsvdir] (immediate)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing execute[start-runsvdir] action nothing (runit::default line 22)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: package[runit] sending nothing action to execute[runit-hup-init] (immediate)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing execute[runit-hup-init] action nothing (runit::default line 31)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing directory[/etc/sv/haibu-server] action create (haibu::default line 31)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server] created directory /etc/sv/haibu-server
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server] owner changed to 0
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server] group changed to 0
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server] mode changed to 755
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing directory[/etc/sv/haibu-server/log] action create (haibu::default line 38)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log] created directory /etc/sv/haibu-server/log
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log] owner changed to 0
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log] group changed to 0
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log] mode changed to 755
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing directory[/etc/sv/haibu-server/log/main] action create (haibu::default line 45)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log/main] created directory /etc/sv/haibu-server/log/main
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log/main] owner changed to 0
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log/main] group changed to 0
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: directory[/etc/sv/haibu-server/log/main] mode changed to 755
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing template[/etc/sv/haibu-server/run] action create (haibu::default line 52)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: template[/etc/sv/haibu-server/run] mode changed to 755
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: template[/etc/sv/haibu-server/run] updated content
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing template[/etc/sv/haibu-server/log/run] action create (haibu::default line 63)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: template[/etc/sv/haibu-server/log/run] mode changed to 755
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: template[/etc/sv/haibu-server/log/run] updated content
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing link[/etc/init.d/haibu-server] action create (haibu::default line 123)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: link[/etc/init.d/haibu-server] created
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing link[/etc/service/haibu-server] action create (haibu::default line 129)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: link[/etc/service/haibu-server] created
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:28 -0700] INFO: Processing ruby_block[supervise_haibu-server_sleep] action create (haibu::default line 134)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:33 -0700] INFO: ruby_block[supervise_haibu-server_sleep] called
    [Wed, 19 Oct 2011 17:02:33 -0700] INFO: Processing service[haibu-server] action nothing (haibu::default line 142)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:33 -0700] INFO: Processing package[git-core] action install (git::default line 21)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:50 -0700] INFO: package[git-core] installed version 1:1.7.0.4-1ubuntu0.2
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:50 -0700] INFO: template[/etc/sv/haibu-server/run] sending restart action to service[haibu-server] (delayed)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:50 -0700] INFO: Processing service[haibu-server] action restart (haibu::default line 142)
    : stdout
    [default] [Wed, 19 Oct 2011 17:02:50 -0700] INFO: service[haibu-server] restarted
    [Wed, 19 Oct 2011 17:02:50 -0700] INFO: Chef Run complete in 476.674103 seconds
    [Wed, 19 Oct 2011 17:02:50 -0700] INFO: Running report handlers
    [Wed, 19 Oct 2011 17:02:50 -0700] INFO: Report handlers complete
    : stdout

