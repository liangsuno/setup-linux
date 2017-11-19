#
# Cookbook:: setup-linux
# Recipe:: setup-terrahelp
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['terrahelp']['url'] = 'https://github.com/opencredo/terrahelp/releases/download/v0.6.3/terrahelp-linux-amd64'
node.default['terrahelp']['checksum'] = '82ae81a1902a04e9be4f8409ceb0c5725a37f3832febd0685301a0f3e5621e8b'
node.default['terrahelp']['download'] = '/usr/local/bin/terrahelp'

remote_file node['terrahelp']['download'] do
  source node['terrahelp']['url']
  checksum node['terrahelp']['checksum']
  mode '0755'
  not_if { ::File.exist?("/usr/local/bin/terrahelp") }
end
