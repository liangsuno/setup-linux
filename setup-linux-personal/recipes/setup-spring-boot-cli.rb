#
# Cookbook:: setup-linux-personal
# Recipe:: setup-spring-boot-cli
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash 'Setup Spring Boot CLI' do
  code <<-EOH
    source #{ENV['HOME']}/.sdkman/bin/sdkman-init.sh
    sdk install springboot
    EOH
end
