#
# Cookbook:: setup-linux-personal
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe '::setup-git'
include_recipe '::setup-bash'
include_recipe '::setup-sdkman'
include_recipe '::setup-groovy'
include_recipe '::setup-spring-boot-cli'
