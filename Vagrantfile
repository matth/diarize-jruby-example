# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Box settings

  config.vm.box       = 'ubuntu14.04'
  config.vm.box_url   = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.host_name = 'diarize-jruby-example'

  # Network settings

  config.vm.network :private_network, :ip => '192.168.51.131'

  # Provider settings

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
  end

  # Provisioning

  config.vm.provision :shell, :inline => %Q{
    apt-get update
    apt-get upgrade -y

    # Install java

    apt-get install -y openjdk-7-jre-headless

    # Install jruby

    wget --continue -O /tmp/jruby.tar.gz \
     https://s3.amazonaws.com/jruby.org/downloads/1.7.19/jruby-bin-1.7.19.tar.gz

    rm -rf /home/vagrant/jruby

    mkdir /home/vagrant/jruby

    tar xvzf /tmp/jruby.tar.gz -C /home/vagrant/jruby/ --strip-components=1

    # Set permissions

    chown -R vagrant:vagrant /home/vagrant/jruby

    # Install diarize gem

    su vagrant -c "/home/vagrant/jruby/bin/jruby -S gem install diarize-jruby"
  }

end
