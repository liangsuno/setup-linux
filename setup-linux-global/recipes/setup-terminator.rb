#
# Cookbook:: setup-linux-global
# Recipe:: setup-terminator
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node[:platform_family].include?("rhel")
  package 'terminator'
end

if node[:platform_family].include?("debian")
  node.default['terminator']['url'] = 'https://launchpad.net/terminator/gtk3/1.91/+download/terminator-1.91.tar.gz'
  node.default['terminator']['checksum'] = '95f76e3c0253956d19ceab2f8da709a496f1b9cf9b1c5b8d3cd0b6da3cc7be69'
  node.default['terminator']['download'] = '/tmp/terminator-1.91.tar.gz'

  package %w(python-psutil terminator)

  remote_file node['terminator']['download'] do
    source node['terminator']['url']
    checksum node['terminator']['checksum']
    not_if { ::File.exist?("/usr/local/terminator/terminator") }
  end

  tar_extract node['terminator']['download'] do
    target_dir '/usr/local'
    creates '/usr/local/terminator-1.91'
    user 'root'
    group 'root'
    action :extract_local
  end

  execute 'chown -R root:root' do
    command 'chown -R root:root /usr/local/terminator-1.91'
  end

  execute 'Update terminator.desktop' do
    command "sed -i 's#^Exec=.*#Exec=/usr/local/terminator-1.91/terminator#' /usr/share/applications/terminator.desktop"
  end

  template "#{ENV['HOME']}/.config/terminator/config" do
    source "terminator-config.erb"
  end
end
