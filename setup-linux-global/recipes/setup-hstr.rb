#
# Cookbook:: setup-linux-global
# Recipe:: setup-hstr
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node[:platform_family].include?("rhel")
  package 'hstr'
end

if node[:platform_family].include?("debian")
  apt_repository 'hstr' do
    uri 'ppa:ultradvorka/ppa'
  end
  package %w(hh)
end

#execute 'Install hstr config' do
#  command 'hh --show-configuration >> ~/.bashrc'
#end
