default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'

# default['audit']['profiles'] = [
#   {
#     name: 'CIS CentOS Linux 7 Benchmark Level 1',
#     compliance: 'admin/cis-centos7-level1',
#   },
#   {
#     name: 'CIS CentOS Linux 7 Benchmark Level 2',
#     compliance: 'admin/cis-centos7-level2',
#   },
# ]

if node['os'] == 'linux'
  default['audit']['profiles'] = [
    {
      name: 'DevSec Linux Security Baseline',
      compliance: 'admin/linux-baseline',
    },
  ]
elsif node['os'] == 'windows'
  default['audit']['profiles'] = [
    {
      name: 'DevSec Windows Security Baseline',
      compliance: 'admin/windows-baseline',
    },
  ]
end
