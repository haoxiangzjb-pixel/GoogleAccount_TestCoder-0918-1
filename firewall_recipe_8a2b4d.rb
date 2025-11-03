# Chef Recipe to Configure Firewall Rules
#
# This recipe configures firewall rules using the iptables or ufw resources
# depending on the platform. It sets up basic firewall rules to allow
# necessary services while blocking unauthorized access.

# Configure firewall based on platform
case node['platform_family']
when 'debian'
  # For Debian/Ubuntu systems, use ufw
  package 'ufw' do
    action :install
  end

  # Enable ufw firewall
  bash 'enable-ufw' do
    code 'ufw --force enable'
    not_if 'ufw status | grep -q "Status: active"'
    action :run
  end

  # Allow SSH connections
  execute 'allow-ssh' do
    command 'ufw allow ssh'
    not_if 'ufw status | grep -q "22/tcp.*ALLOW"'
  end

  # Allow HTTP connections
  execute 'allow-http' do
    command 'ufw allow http'
    not_if 'ufw status | grep -q "80/tcp.*ALLOW"'
  end

  # Allow HTTPS connections
  execute 'allow-https' do
    command 'ufw allow https'
    not_if 'ufw status | grep -q "443/tcp.*ALLOW"'
  end

  # Allow specific port (example: 8080)
  execute 'allow-custom-port' do
    command 'ufw allow 8080'
    not_if 'ufw status | grep -q "8080/tcp.*ALLOW"'
  end

  # Deny all other incoming connections by default
  execute 'deny-incoming' do
    command 'ufw default deny incoming'
    not_if 'ufw status | grep -q "deny.*incoming"'
  end

  # Allow all outgoing connections by default
  execute 'allow-outgoing' do
    command 'ufw default allow outgoing'
    not_if 'ufw status | grep -q "allow.*outgoing"'
  end

when 'rhel', 'fedora'
  # For RHEL/CentOS/Fedora systems, use firewalld or iptables
  package 'firewalld' do
    action :install
  end

  # Enable and start firewalld service
  service 'firewalld' do
    action [:enable, :start]
    supports :status => true, :restart => true
  end

  # Allow SSH service
  execute 'firewall-cmd-ssh' do
    command 'firewall-cmd --permanent --add-service=ssh && firewall-cmd --reload'
    not_if 'firewall-cmd --permanent --list-services | grep -q ssh'
    only_if { service 'firewalld' }
  end

  # Allow HTTP service
  execute 'firewall-cmd-http' do
    command 'firewall-cmd --permanent --add-service=http && firewall-cmd --reload'
    not_if 'firewall-cmd --permanent --list-services | grep -q http'
    only_if { service 'firewalld' }
  end

  # Allow HTTPS service
  execute 'firewall-cmd-https' do
    command 'firewall-cmd --permanent --add-service=https && firewall-cmd --reload'
    not_if 'firewall-cmd --permanent --list-services | grep -q https'
    only_if { service 'firewalld' }
  end

  # Allow custom port (example: 8080)
  execute 'firewall-cmd-custom-port' do
    command 'firewall-cmd --permanent --add-port=8080/tcp && firewall-cmd --reload'
    not_if "firewall-cmd --permanent --list-ports | grep -q '8080/tcp'"
    only_if { service 'firewalld' }
  end

else
  # For other systems, use iptables directly
  package 'iptables' do
    action :install
  end

  # Basic iptables rules
  template '/etc/iptables/rules.v4' do
    source 'iptables_rules.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[iptables]', :immediately
  end

  service 'iptables' do
    action [:enable, :start]
  end
end

# Recipe to open a custom port based on attribute
# Example: node['firewall']['allowed_ports'] = [80, 443, 8080]
node['firewall']['allowed_ports'].each do |port|
  case node['platform_family']
  when 'debian'
    execute "allow-port-#{port}" do
      command "ufw allow #{port}"
      not_if "ufw status | grep -q '#{port}/tcp.*ALLOW'"
    end
  when 'rhel', 'fedora'
    execute "firewall-cmd-port-#{port}" do
      command "firewall-cmd --permanent --add-port=#{port}/tcp && firewall-cmd --reload"
      not_if "firewall-cmd --permanent --list-ports | grep -q '#{port}/tcp'"
    end
  end
end if node['firewall'] && node['firewall']['allowed_ports']

# Default attributes for firewall configuration
# These would typically be in attributes/default.rb
default_attributes = {
  'firewall' => {
    'allowed_ports' => [22, 80, 443],
    'enable' => true,
    'allow_ssh' => true,
    'allow_http' => true,
    'allow_https' => true
  }
}

# Set up basic security rules
ruby_block 'display-firewall-info' do
  block do
    Chef::Log.info('Firewall configuration completed')
    Chef::Log.info("Allowed ports: #{node['firewall']['allowed_ports'].join(', ')}")
  end
  action :run
end