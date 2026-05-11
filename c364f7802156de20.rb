#
# Cookbook: firewall_rules
# Recipe: default
# Description: Configure firewall rules using iptables
#

default['firewall']['rules'] = [
  {
    'name' => 'ssh',
    'port' => 22,
    'protocol' => 'tcp',
    'action' => 'ACCEPT',
    'source' => '0.0.0.0/0'
  },
  {
    'name' => 'http',
    'port' => 80,
    'protocol' => 'tcp',
    'action' => 'ACCEPT',
    'source' => '0.0.0.0/0'
  },
  {
    'name' => 'https',
    'port' => 443,
    'protocol' => 'tcp',
    'action' => 'ACCEPT',
    'source' => '0.0.0.0/0'
  },
  {
    'name' => 'drop_invalid',
    'state' => 'INVALID',
    'action' => 'DROP'
  }
]

default['firewall']['default_policy'] = 'DROP'
default['firewall']['enable_logging'] = true

template '/etc/iptables/rules.v4' do
  source 'iptables.rules.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    rules: node['firewall']['rules'],
    default_policy: node['firewall']['default_policy'],
    enable_logging: node['firewall']['enable_logging']
  )
  notifies :run, 'execute[reload-iptables]', :immediately
end

execute 'reload-iptables' do
  command 'iptables-restore < /etc/iptables/rules.v4'
  action :nothing
end

# Ensure iptables-persistent is installed
package 'iptables-persistent' do
  action :install
end
