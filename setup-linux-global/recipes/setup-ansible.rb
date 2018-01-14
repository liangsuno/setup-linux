#
# Cookbook:: setup-linux-global
# Recipe:: setup-ansible
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node[:platform_family].include?("debian")
  apt_repository 'ansible' do
    uri 'ppa:ansible/ansible'
  end

  package %w(software-properties-common)
end

package %w(ansible)  do
  action :upgrade
end

#python_runtime '2'
python_runtime 'myapp' do
  version '2.7'
#  get_pip_url ''
  options pip_version: true
end

#package %w(centos-release-scl-rh python27-python)

#python_runtime 'myapp' do
#  provider :scl
#  version '2.7.13'
#end

#python_package 'pip' do
#  :install
#end

#pip install --upgrade pip
#execute 'pip install --upgrade pip' do
#  command '/usr/bin/pip install --upgrade pip'
#end

# Install Ansible container
#python_package 'ansible-container[docker,k8s,openshift]' do
#end
