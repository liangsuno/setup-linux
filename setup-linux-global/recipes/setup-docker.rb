#
# Cookbook:: setup-linux-global
# Recipe:: setup-docker
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node[:platform_family].include?("debian")
  docker_installation_package 'default' do
    version node['docker']['version']
    action :create
    package_options %q|--force-yes -o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-all'| # if Ubuntu for example
  end

  docker_service 'default' do
    action [:create, :start]
  end
end

if node[:platform_family].include?("rhel")
  package %w(docker docker-common docker-selinux) do
    action :remove
  end
  package %w(yum-utils device-mapper-persistent-data lvm2)
  execute 'Import docker gpg key' do
    command "rpm --import 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e'"
  end
  execute 'Import docker-engine gpg key' do
    command 'rpm --import https://yum.dockerproject.org/gpg'
  end
  if (node['setup-linux-global']['docker']['version'] == 'docker-ce')
    yum_package 'docker-engine' do
        action :remove
    end
    execute 'Install docker-ce repo' do
      command 'yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo'
    end
    execute 'Enable docker-ce repo' do
      command 'yum-config-manager --enable docker-ce'
    end
    docker_installation_package 'default' do
      action :create
    end
  else
    yum_package 'docker-ce' do
        action :remove
    end
    execute 'Disable docker-ce repo' do
      command 'yum-config-manager --disable docker-ce'
    end
    execute 'Install docker-engine repo' do
      command 'yum-config-manager --add-repo https://yum.dockerproject.org/repo/main/centos/7'
    end
    docker_installation_package 'default' do
      version node['setup-linux-global']['docker']['version']
      package_name 'docker-engine'
      action :create
    end
  end

  docker_service 'default' do
    action [:create, :start]
  end
end

node.default['docker-compose']['url'] = 'https://github.com/docker/compose/releases/download/1.18.0/docker-compose-Linux-x86_64'
node.default['docker-compose']['checksum'] = 'b2f2c3834107f526b1d9cc8d8e0bdd132c6f1495b036a32cbc61b5288d2e2a01'
node.default['docker-compose']['download'] = '/usr/local/bin/docker-compose'

remote_file node['docker-compose']['download'] do
  source node['docker-compose']['url']
  checksum node['docker-compose']['checksum']
  mode '0755'
  not_if { ::File.exist?(node['docker-compose']['download']) }
end
