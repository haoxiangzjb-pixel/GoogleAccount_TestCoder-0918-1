# A simple Chef recipe to install a package

# Install the 'curl' package
package 'curl' do
  action :install
end

# Example of installing different packages based on platform
case node['platform_family']
when 'debian'
  package 'git' do
    action :install
  end
when 'rhel', 'fedora'
  package 'git' do
    action :install
  end
end

# Ensure a service is running (example)
service 'apache2' do
  action [:enable, :start]
end