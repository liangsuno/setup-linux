#
# Cookbook:: setup-linux-global
# Recipe:: setup-basics
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['yum']['epel-testing']['enabled'] = true
node.default['yum']['epel-testing']['managed'] = true
include_recipe 'yum-epel'

package %w(
  tree telnet curl wget jq moreutils terminator openconnect
)

package 'maven' do
  action :remove
end

include_recipe 'maven'

#template '/etc/environment' do
#  source 'environment.erb'
#end
