#
# Cookbook:: setup-linux-global
# Recipe:: setup-docker
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'chef-apt-docker'

docker_service 'default' do
  action [:create, :start]
end

node.default['docker-compose']['url'] = 'https://github.com/docker/compose/releases/download/1.17.0/docker-compose-Linux-x86_64'
node.default['docker-compose']['checksum'] = 'b553025b82fc61547933f05693716c92967b835979ba9b092b31e50bd35e30c9'
node.default['docker-compose']['download'] = '/usr/local/bin/docker-compose'

remote_file node['docker-compose']['download'] do
  source node['docker-compose']['url']
  checksum node['docker-compose']['checksum']
  mode '0755'
  not_if { ::File.exist?(node['docker-compose']['download']) }
end
