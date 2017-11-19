#
# Cookbook:: setup-linux-global
# Recipe:: setup-ansible
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'ansible' do
  uri 'ppa:ansible/ansible'
end

package %w(software-properties-common ansible)

python_runtime '2'

# Install Ansible container
python_package 'ansible-container[docker,k8s,openshift]' do
end
