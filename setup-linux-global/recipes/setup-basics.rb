#
# Cookbook:: setup-linux
# Recipe:: setup-basics
#
# Copyright:: 2017, The Authors, All Rights Reserved.

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
