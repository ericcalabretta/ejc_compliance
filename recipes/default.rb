#
# Cookbook:: ejc_compliance
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'audit::default'

# uncomment to correct DevSec profile issues - Linux or Windows
include_recipe 'ejc_compliance::devsec_hardening'
# uncomment to correct DevSec profile issues - Centos only
include_recipe 'ejc_compliance::cis_l1_hardening'
