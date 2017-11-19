#
# Cookbook:: setup-linux-global
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe '::setup-basics'
include_recipe '::setup-git'
include_recipe '::setup-ansible'
include_recipe '::setup-docker'
include_recipe '::setup-oracle-java'
include_recipe '::setup-packer'
include_recipe '::setup-terraform'
include_recipe '::setup-terrahelp'
include_recipe '::setup-terminator'
include_recipe '::setup-hstr'
