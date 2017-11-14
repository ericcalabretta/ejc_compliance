# ejc_compliance

TODO: Enter the cookbook description here.


Sample /etc/opscode/chef-server.rb file on Chef Server
Increases max chef-object size to accommodate large profiles & configures Chef Automate as a destination for onverge/compliance

opscode_erchef['max_request_size'] = '10000000'
nginx['client_max_body_size'] = '2500m'
data_collector['root_url'] = 'https://FQDNofChefAutomate/data-collector/v0/'
profiles['root_url'] = 'https://FQDNofChefAutomate'

reconfigure chef-server to pickup changes
sudo chef-server-ctl reconfigure

Login to Chef Automate and download any needed profiles
