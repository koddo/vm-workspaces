
Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-jessie64"   # this box has everything for shared folders and nfs preinstalled

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "vagrant_ansible_playbook.yml"
  end

  
  config.vm.hostname = "vagrant"
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder ".", "/workspaces", disabled: true

  
  config.vm.synced_folder "blog", "/workspace.blog"
  config.vm.synced_folder "superlearn-wiki", "/workspace.superlearn-wiki"
  config.vm.synced_folder "~/Dropbox", "/vagrant-dropbox"
  config.vm.synced_folder "~/Disk.Yandex", "/vagrant-disk-yandex"
  # doesn't work with type: "nfs", throws permissions errors, because jekyll tries to run `chown -r .` by whatever reason

  
  config.vm.synced_folder ".", "/vagrant-wrong-uid", type: "nfs"
  config.bindfs.bind_folder    "/vagrant-wrong-uid", "/workspaces",
                               create_as_user: true
  # after: :provision
  # perms: 'u=rwX:g=rD:o=rD'   # http://bindfs.org/docs/bindfs.1.html#sect12
  

  
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 1
    vb.memory = 2048
  end

end
