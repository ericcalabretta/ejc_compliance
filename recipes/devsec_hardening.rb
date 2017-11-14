#
# Cookbook:: ejc_compliance
# Recipe:: decsec_hardening
#
# Copyright:: 2017, The Authors, All Rights Reserved.

## include dev-sec hardening based on IF statement

case node['os']
when 'linux'
  include_recipe 'os-hardening::default'
when 'windows'
  include_recipe 'windows-hardening::default'
end
