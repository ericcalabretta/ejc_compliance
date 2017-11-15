# ejc_compliance
# By default this cookbook scans for DevSec OS Baseline and CIS Level 1 OS baseline.

# platforms
Centos 7
Ubuntu 16.04
Windows 2016

## Instructions:
#### 1.Login to Chef Automate and download any needed profiles - using the 'admin' account
DevSec Linux Security Baseline

DevSec Windows Patch Baseline

CIS CentOS Linux 7 Benchmark Level 1

CIS Ubuntu Linux 16.04 LTS Benchmark Level 1 - Server

#### 2. Configure Chef Server
You'll need to configure Chef-Server to send data to Chef Automate and increase the max size if you're using larger compliance profiles like the CIS benchmarks.

Sample: /etc/opscode/chef-server.rb

```bash
opscode_erchef['max_request_size'] = '10000000'
nginx['client_max_body_size'] = '2500m'
data_collector['root_url'] = 'https://FQDNofChefAutomate/data-collector/v0/'
profiles['root_url'] = 'https://FQDNofChefAutomate'
```

#### 3. Reconfigure chef-server to pickup changes
```bash
sudo chef-server-ctl reconfigure
```

#### 4. To correct some of the compliance failures you can apply hardening cookbooks
uncomment the ejc_compliance::devsec_hardening recipe in default.rb to apply DevSec hardening cookbook on Ubuntu, Centos, or Windwos

uncomment the include_recipe 'ejc_compliance::cis_l1_hardening'recipe in default.rb to apply CIS L1 hardening cookbook to Centos
