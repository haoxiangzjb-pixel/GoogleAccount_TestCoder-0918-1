#
# Cookbook Name:: firewall_config
# Recipe:: default
# Description:: Configure firewall rules using iptables
#

# Install iptables package
package 'iptables' do
  action :install
end

package 'iptables-persistent' do
  action :install
end

# Define firewall rules
firewall_rules = [
  { name: 'allow_ssh', port: 22, protocol: 'tcp', source: '0.0.0.0/0', action: 'ACCEPT', comment: 'Allow SSH access' },
  { name: 'allow_http', port: 80, protocol: 'tcp', source: '0.0.0.0/0', action: 'ACCEPT', comment: 'Allow HTTP access' },
  { name: 'allow_https', port: 443, protocol: 'tcp', source: '0.0.0.0/0', action: 'ACCEPT', comment: 'Allow HTTPS access' },
  { name: 'allow_loopback', interface: 'lo', action: 'ACCEPT', comment: 'Allow loopback traffic' },
  { name: 'allow_established', state: ['ESTABLISHED', 'RELATED'], action: 'ACCEPT', comment: 'Allow established connections' },
  { name: 'drop_invalid', state: ['INVALID'], action: 'DROP', comment: 'Drop invalid packets' }
]

# Set default policy to DROP for INPUT chain
execute 'set_default_policy' do
  command 'iptables -P INPUT DROP'
  not_if 'iptables -C INPUT -j DROP'
end

# Apply each firewall rule
firewall_rules.each do |rule|
  rule_name = rule[:name]
  
  build_iptables_command = lambda do
    cmd = ['iptables']
    
    if rule[:state]
      cmd << '-A' << 'INPUT' << '-m' << 'state' << '--state' << rule[:state].join(',')
    else
      cmd << '-A' << 'INPUT'
      cmd << '-p' << rule[:protocol] if rule[:protocol]
      cmd << '--dport' << rule[:port].to_s if rule[:port]
      cmd << '-s' << rule[:source] if rule[:source]
      cmd << '-i' << rule[:interface] if rule[:interface]
    end
    
    cmd << '-j' << rule[:action]
    cmd << '-m' << 'comment' << '--comment' << "\"#{rule[:comment]}\"" if rule[:comment]
    
    cmd.join(' ')
  end
  
  execute "firewall_rule_#{rule_name}" do
    command build_iptables_command.call
    not_if "iptables -C #{build_iptables_command.call.gsub('-A', '-C').split(' -j ').first}"
    notifies :run, 'execute[save_iptables_rules]', :delayed
  end
end

# Save iptables rules to persist across reboots
execute 'save_iptables_rules' do
  command 'iptables-save > /etc/iptables/rules.v4'
  action :nothing
end

# Log firewall configuration status
log 'Firewall configuration completed' do
  level :info
end
