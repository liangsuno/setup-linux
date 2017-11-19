#
# Cookbook:: setup-linux-global
# Recipe:: setup-hstr
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'hstr' do
  uri 'ppa:ultradvorka/ppa'
end

package %w(hh)

#execute 'Install hstr config' do
#  command 'hh --show-configuration >> ~/.bashrc'
#end
