# By default this cookbook scans for DevSec OS Baseline and CIS Level 1 OS baseline.

# platforms
Centos 7

Ubuntu 16.04

Windows Server 2016

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
opscode_erchef['max_request_size'] = '1500000'
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

#### Bootstrap nodes example commands - with knife
###### Linux - knife bootstrap example
```bash
knife bootstrap -i Path_to_Identity_file Username@FQDN -N Your_Node_Name --sudo -run-list 'recipe[Your_Cookbook_Name]'
```
###### windows(windows firewall needs to permit inbound WinRM traffic)
###### example powershell command to permit WinRM
```bash
Get-NetFirewallPortFilter | ?{$_.LocalPort -eq 5985 } | Get-NetFirewallRule | ?{ $_.Direction -eq "Inbound" -and $_.Profile -eq "Public" -and $_.Action -eq "Allow"} | Set-NetFirewallRule -RemoteAddress "Any"
```
###### Windows - knife bootstrap example
```bash
knife bootstrap windows winrm ADDRESS --winrm-user USER --winrm-password 'PASSWORD' --node-name Your_Node_Name --run-list 'recipe[Your_Cookbook_Name]'
```
#### Kicking off Chef Client runs (or you can schedule with chef-client cookbook)
###### Linux (on AWS using public hostname)
```bash
knife ssh 'name:Your_Node_Name' 'sudo chef-client' -x Username -i Path_to_Identity_file -a ec2.public_hostname
```
###### windows (on AWS using public hostname)
```bash
knife winrm 'name:Your_Node_Name' chef-client --winrm-user USER --winrm-password 'PASSWORD' --attribute cloud.public_hostname
```
