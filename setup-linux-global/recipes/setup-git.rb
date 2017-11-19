#
# Cookbook:: setup-linux-global
# Recipe:: setup-git
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'git' do
  uri 'ppa:git-core/ppa'
end

package %w(git)
