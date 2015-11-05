VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vbguest.auto_update = false
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = true

#==> default: stdin: is not a tty
#If you're using Vagrant with Ubuntu and getting this annoying (but not impactful) error during provisioning, Just paste this into your Vagrantfile as the first provisioner:
#http://foo-o-rama.com/vagrant--stdin-is-not-a-tty--fix.html

  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end  
  
  config.vm.define 'spine111' do |spine111|
    spine111.vm.box = 'cumulus-vx-2.5.3'
	spine111.vm.hostname = 'Spine-111'
	
	spine111.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000111']
    end	
	
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    spine111.vm.network 'private_network', virtualbox__intnet: 'netmgmt', auto_config: false

	# Configure rest of downlink ports towards leaf switches.
    spine111.vm.network 'private_network', virtualbox__intnet: 'S111L131P1P1'#, auto_config: false
    spine111.vm.network 'private_network', virtualbox__intnet: 'S111L132P2P1'#, auto_config: false
    spine111.vm.network 'private_network', virtualbox__intnet: 'S111L141P3P3'#, auto_config: false
    spine111.vm.network 'private_network', virtualbox__intnet: 'S111L142P4P3'#, auto_config: false
	spine111.vm.network 'private_network', virtualbox__intnet: 'S111S112P5P5_CLAG'#, auto_config: false
    spine111.vm.network 'private_network', virtualbox__intnet: 'S111S112P6P6_CLAG'#, auto_config: false

	spine111.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.2/24 brd + dev swp1"
	spine111.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
	spine111.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.

  end
 
  config.vm.define 'spine112' do |spine112|
    spine112.vm.box = 'cumulus-vx-2.5.3'
	spine112.vm.hostname = 'Spine-112'
	
	spine112.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000112']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    spine112.vm.network 'private_network', ip: '10.0.0.3/24', virtualbox__intnet: 'netmgmt', auto_config: false

	# Configure rest of downlink ports towards leaf switches.
    spine112.vm.network 'private_network', virtualbox__intnet: 'S112L131P1P2'#, auto_config: false
    spine112.vm.network 'private_network', virtualbox__intnet: 'S112L132P2P2'#, auto_config: false
    spine112.vm.network 'private_network', virtualbox__intnet: 'S112L141P3P4'#, auto_config: false
    spine112.vm.network 'private_network', virtualbox__intnet: 'S112L142P4P4'#, auto_config: false
	spine112.vm.network 'private_network', virtualbox__intnet: 'S111S112P5P5_CLAG'#, auto_config: false
    spine112.vm.network 'private_network', virtualbox__intnet: 'S111S112P6P6_CLAG'#, auto_config: false
	
	spine112.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.3/24 brd + dev swp1"
	spine112.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
    spine112.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
	
  end
 
  config.vm.define 'spine121' do |spine121|
    spine121.vm.box = 'cumulus-vx-2.5.3'
	spine121.vm.hostname = 'Spine-121'
	
	spine121.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000121']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    spine121.vm.network 'private_network', ip: '10.0.0.4/24', virtualbox__intnet: 'netmgmt', auto_config: false
	
	# Configure rest of downlink ports towards leaf switches.
    spine121.vm.network 'private_network', virtualbox__intnet: 'S121L141P1P1'#, auto_config: false
    spine121.vm.network 'private_network', virtualbox__intnet: 'S121L142P2P1'#, auto_config: false
    spine121.vm.network 'private_network', virtualbox__intnet: 'S121L131P3P3'#, auto_config: false
    spine121.vm.network 'private_network', virtualbox__intnet: 'S121L132P4P3'#, auto_config: false
	spine121.vm.network 'private_network', virtualbox__intnet: 'S121S122P5P5_CLAG'#, auto_config: false
    spine121.vm.network 'private_network', virtualbox__intnet: 'S121S122P6P6_CLAG'#, auto_config: false
	
	spine121.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.4/24 brd + dev swp1"
	spine121.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
    spine121.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
	
  end
  
  config.vm.define 'spine122' do |spine122|
    spine122.vm.box = 'cumulus-vx-2.5.3'
	spine122.vm.hostname = 'Spine-122'
	
	spine122.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000122']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    spine122.vm.network 'private_network', ip: '10.0.0.5/24', virtualbox__intnet: 'netmgmt', auto_config: false

	# Configure rest of downlink ports towards leaf switches.
	spine122.vm.network 'private_network', virtualbox__intnet: 'S122L141P1P2'#, auto_config: false
    spine122.vm.network 'private_network', virtualbox__intnet: 'S122L142P2P2'#, auto_config: false
    spine122.vm.network 'private_network', virtualbox__intnet: 'S122L131P3P4'#, auto_config: false
    spine122.vm.network 'private_network', virtualbox__intnet: 'S122L132P4P4'#, auto_config: false
	spine122.vm.network 'private_network', virtualbox__intnet: 'S121S122P5P5_CLAG'#, auto_config: false
    spine122.vm.network 'private_network', virtualbox__intnet: 'S121S122P6P6_CLAG'#, auto_config: false
	
	spine122.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.5/24 brd + dev swp1"
	spine122.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
	spine122.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
		
  end
  
  config.vm.define 'leaf131' do |leaf131|
    leaf131.vm.box = 'cumulus-vx-2.5.3'
	leaf131.vm.hostname = 'Leaf-131'
	
	leaf131.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000131']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    leaf131.vm.network 'private_network', ip: '10.0.0.6/24', virtualbox__intnet: 'netmgmt', auto_config: false
    
	# Configure rest of the switchports for inter-switch and host communication.
	leaf131.vm.network 'private_network', virtualbox__intnet: 'S111L131P1P1'#, auto_config: false
    leaf131.vm.network 'private_network', virtualbox__intnet: 'S112L131P1P2'#, auto_config: false
    leaf131.vm.network 'private_network', virtualbox__intnet: 'S121L131P3P3'#, auto_config: false
    leaf131.vm.network 'private_network', virtualbox__intnet: 'S122L131P3P4'#, auto_config: false
	leaf131.vm.network 'private_network', virtualbox__intnet: 'L131L132P5P5_CLAG'#, auto_config: false
    leaf131.vm.network 'private_network', virtualbox__intnet: 'L131L132P6P6_CLAG'#, auto_config: false
	leaf131.vm.network 'private_network', virtualbox__intnet: 'L131H1P7E1'#, auto_config: false
	
	leaf131.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.6/24 brd + dev swp1"
	leaf131.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
	leaf131.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
	
  end
  
  config.vm.define 'leaf132' do |leaf132|
    leaf132.vm.box = 'cumulus-vx-2.5.3'
	leaf132.vm.hostname = 'Leaf-132'
	
	leaf132.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000132']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    leaf132.vm.network 'private_network', ip: '10.0.0.7/24', virtualbox__intnet: 'netmgmt', auto_config: false
    
	# Configure rest of the switchports for inter-switch and host communication.
	leaf132.vm.network 'private_network', virtualbox__intnet: 'S111L132P2P1'#, auto_config: false
    leaf132.vm.network 'private_network', virtualbox__intnet: 'S112L132P2P2'#, auto_config: false
    leaf132.vm.network 'private_network', virtualbox__intnet: 'S121L132P4P3'#, auto_config: false
    leaf132.vm.network 'private_network', virtualbox__intnet: 'S122L132P4P4'#, auto_config: false
	leaf132.vm.network 'private_network', virtualbox__intnet: 'L131L132P5P5_CLAG'#, auto_config: false
    leaf132.vm.network 'private_network', virtualbox__intnet: 'L131L132P6P6_CLAG'#, auto_config: false
	leaf132.vm.network 'private_network', virtualbox__intnet: 'L132H1P7E2'#, auto_config: false
	
	leaf132.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.7/24 brd + dev swp1"
	leaf132.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
    leaf132.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
	
  end
  
  config.vm.define 'leaf141' do |leaf141|
    leaf141.vm.box = 'cumulus-vx-2.5.3'
	leaf141.vm.hostname = 'Leaf-141'
	
	leaf141.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000141']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    leaf141.vm.network 'private_network', ip: '10.0.0.8/24', virtualbox__intnet: 'netmgmt', auto_config: false
    
	# Configure rest of the switchports for inter-switch and host communication.
	leaf141.vm.network 'private_network', virtualbox__intnet: 'S121L141P1P1'#, auto_config: false
    leaf141.vm.network 'private_network', virtualbox__intnet: 'S122L141P1P2'#, auto_config: false
    leaf141.vm.network 'private_network', virtualbox__intnet: 'S111L141P3P3'#, auto_config: false
    leaf141.vm.network 'private_network', virtualbox__intnet: 'S112L141P3P4'#, auto_config: false
	leaf141.vm.network 'private_network', virtualbox__intnet: 'L141L142P5P5_CLAG'#, auto_config: false
    leaf141.vm.network 'private_network', virtualbox__intnet: 'L141L142P6P6_CLAG'#, auto_config: false
	leaf141.vm.network 'private_network', virtualbox__intnet: 'L141H2P7E1'#, auto_config: false
	
	leaf141.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.8/24 brd + dev swp1"
	leaf141.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
	leaf141.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
	
  end
  
  config.vm.define 'leaf142' do |leaf142|
    leaf142.vm.box = 'cumulus-vx-2.5.3'
	leaf142.vm.hostname = 'Leaf-142'
	
	leaf142.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000142']
    end	
	  
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    leaf142.vm.network 'private_network', ip: '10.0.0.9/24', virtualbox__intnet: 'netmgmt', auto_config: false
    
	# Configure rest of the switchports for inter-switch and host communication.
	leaf142.vm.network 'private_network', virtualbox__intnet: 'S121L142P2P1'#, auto_config: false
    leaf142.vm.network 'private_network', virtualbox__intnet: 'S122L142P2P2'#, auto_config: false
    leaf142.vm.network 'private_network', virtualbox__intnet: 'S111L142P4P3'#, auto_config: false
    leaf142.vm.network 'private_network', virtualbox__intnet: 'S112L142P4P4'#, auto_config: false
	leaf142.vm.network 'private_network', virtualbox__intnet: 'L141L142P5P5_CLAG'#, auto_config: false
    leaf142.vm.network 'private_network', virtualbox__intnet: 'L141L142P6P6_CLAG'#, auto_config: false
	leaf142.vm.network 'private_network', virtualbox__intnet: 'L142H2P7E2'#, auto_config: false
	
	leaf142.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.9/24 brd + dev swp1"
	leaf142.vm.provision :shell, :inline => "sudo ip link set dev swp1 up"
	leaf142.vm.provision :shell, :inline => "sudo echo \"source /etc/network/interfaces.d/*\" >> /etc/network/interfaces"#as per CUMULUS guideline for managing interfaces using Cumulus provided ansible modules we have to source interfaces file.
	
  end
 
end
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vbguest.auto_update = false
  config.ssh.insert_key = true

#==> default: stdin: is not a tty
#If you're using Vagrant with Ubuntu and getting this annoying (but not impactful) error during provisioning, Just paste this into your Vagrantfile as the first provisioner:
#http://foo-o-rama.com/vagrant--stdin-is-not-a-tty--fix.html

  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end  
    
  config.vm.define 'host1' do |host1|
    host1.vm.box = 'ubuntu14.04'
	host1.vm.hostname = 'Host-1'
	
	host1.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000202']
    end	
		
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    host1.vm.network 'private_network', virtualbox__intnet: 'netmgmt', :adapter => 2, auto_config: false
    
	# Configure uplinks to leaf switches.
	host1.vm.network 'private_network', virtualbox__intnet: 'L131H1P7E1', :adapter => 3, auto_config: false
    host1.vm.network 'private_network', virtualbox__intnet: 'L132H1P7E2', :adapter => 4, auto_config: false

	host1.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.10/24 brd + dev eth1"
	host1.vm.provision :shell, :inline => "sudo ip link set dev eth1 up"
	
  end
  
  config.vm.define 'host2' do |host2|
    host2.vm.box = 'ubuntu14.04'
	host2.vm.hostname = 'Host-2'
	
	config.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000203']
    end	
		
    # Internal network for switchports interfaces.
	
	# Configure out of band management interface.
    host2.vm.network 'private_network', virtualbox__intnet: 'netmgmt', :adapter => 2, auto_config: false

	host2.vm.provision :shell, :inline => "sudo ip addr add 10.0.0.11/24 brd + dev eth1"
	host2.vm.provision :shell, :inline => "sudo ip link set dev eth1 up"
		
	# Configure uplinks to leaf switches.
	host2.vm.network 'private_network', virtualbox__intnet: 'L141H2P7E1', :adapter => 3, auto_config: false
    host2.vm.network 'private_network', virtualbox__intnet: 'L142H2P7E2', :adapter => 4, auto_config: false

  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = true

#==> default: stdin: is not a tty
#If you're using Vagrant with Ubuntu and getting this annoying (but not impactful) error during provisioning, Just paste this into your Vagrantfile as the first provisioner:
#http://foo-o-rama.com/vagrant--stdin-is-not-a-tty--fix.html
	
  config.vm.provision "fix-no-tty", type: "shell" do |s|
	s.privileged = false
	s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end  
    
# Build Ansible provisioner machine...
  
  config.vm.define 'ansible' do |ansible|
    ansible.vm.box = 'ansible-1.9.4-w_cumulus'
	ansible.vm.hostname = 'Provisioner'
	
	ansible.vm.provider 'virtualbox' do |vbox|
      vbox.customize ['modifyvm', :id, '--macaddress2', '000000000009']
    end
	
	# Configure out of band management interface.	
    ansible.vm.network 'private_network', ip: "10.0.0.1", virtualbox__intnet: 'netmgmt', :adapter => 4
#	ansible.vm.provision "shell", path: "./scripts_for_vagrantfile/ssh-key-gen.sh", privileged: false
#	ansible.vm.provision "shell", path: "./scripts_for_vagrantfile/ssh-copy-id_F.sh", privileged: false
	
  end
end

#Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#  if Vagrant::Util::Platform.windows?
#    config.vm.provision :guest_ansible do |ansible|
#      ansible.playbook = '~/ansible/dual-leaf-spine/dual-leaf-spine.yml'
#    end
#  else
#    config.vm.provision :ansible do |ansible|
#      ansible.playbook = '~/ansible/dual-leaf-spine/dual-leaf-spine.yml'
#    end
#  end
#end