#
# Cookbook:: setup-linux
# Recipe:: setup-sdkman
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute 'Setup sdkman' do
  command "curl -s get.sdkman.io | bash"
  not_if { ::Dir.exist?("#{ENV['HOME']}/.sdkman") }
end

