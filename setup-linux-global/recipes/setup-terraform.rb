#
# Cookbook:: setup-linux
# Recipe:: setup-terraform
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['terraform']['version'] = '0.10.8'
node.default['terraform']['url'] = 'https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip'
node.default['terraform']['checksum'] = 'b786c0cf936e24145fad632efd0fe48c831558cc9e43c071fffd93f35e3150db'
node.default['terraform']['download'] = '/tmp/terraform_0.10.8_linux_amd64.zip'

remote_file node['terraform']['download'] do
  source node['terraform']['url']
  checksum node['terraform']['checksum']
  not_if { ::File.exist?("/usr/local/bin/terraform") }
end

execute 'Unzip terraform' do
  command "unzip -o -d /usr/local/bin #{node['terraform']['download']}"
  not_if { ::File.exist?("/usr/local/bin/terraform") }
end
