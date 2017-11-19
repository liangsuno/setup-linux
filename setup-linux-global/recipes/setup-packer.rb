#
# Cookbook:: setup-linux
# Recipe:: setup-packer
#
# Copyright:: 2017, The Authors, All Rights Reserved.


node.default['packer']['url'] = 'https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip?_ga=2.79702487.1706978918.1510372497-2043172713.1507032714'
node.default['packer']['checksum'] = 'e407566e2063ac697e0bbf6f2dd334be448d58bed93f44a186408bf1fc54c552'
node.default['packer']['download'] = '/tmp/packer_1.1.1_linux_amd64.zip'

remote_file node['packer']['download'] do
  source node['packer']['url']
  checksum node['packer']['checksum']
  not_if { ::File.exist?("/usr/local/bin/packer") }
end

execute 'Unzip packer' do
  command "unzip -o -d /usr/local/bin #{node['packer']['download']}"
  not_if { ::File.exist?("/usr/local/bin/packer") }
end
