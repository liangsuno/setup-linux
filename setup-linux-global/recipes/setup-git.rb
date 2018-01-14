#
# Cookbook:: setup-linux-global
# Recipe:: setup-git
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node[:platform_family].include?("debian")
	apt_repository 'git' do
		uri 'ppa:git-core/ppa'
	end
end

package %w(git)
