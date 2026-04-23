Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"

  (1..2).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.network "private_network", ip: "192.168.56.1#{i}"
    end
  end
end
