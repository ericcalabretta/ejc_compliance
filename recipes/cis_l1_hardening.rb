#
# Cookbook:: ejc_compliance
# Recipe:: cis_l1_hardening
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Include CIS_l1 hardeing - only for EL

case node['platform_family']
when 'rhel'
  include_recipe 'cis-el7-l1-hardening::default'
end
