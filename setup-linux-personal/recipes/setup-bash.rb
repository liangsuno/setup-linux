#
# Cookbook:: setup-linux
# Recipe:: setup-bash
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template "#{ENV['HOME']}/.bash_aliases" do
  source 'bash_aliases.erb'
end
