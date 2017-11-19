#
# Cookbook:: setup-linux
# Recipe:: setup-git
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_package 'git' do
  action :install
end

execute 'git config user.email' do
  command "git config --global user.email \"#{node['git']['user.email']}\""
end

execute 'git config user.name' do
  command "git config --global user.name \"#{node['git']['user.name']}\""
end
