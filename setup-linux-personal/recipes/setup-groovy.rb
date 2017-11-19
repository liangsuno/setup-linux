#
# Cookbook:: setup-linux
# Recipe:: setup-groovy
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash 'Setup groovy' do
  code <<-EOH
    source #{ENV['HOME']}/.sdkman/bin/sdkman-init.sh
    sdk install groovy
    EOH
end
