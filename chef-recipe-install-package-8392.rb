# Chef Recipe for Installing a Package
#
# This recipe installs a package using the package resource
# It works across different platforms (Ubuntu, CentOS, etc.)

# Install the 'curl' package
package 'curl' do
  action :install
end

# Example of installing multiple packages
%w[wget git vim].each do |pkg|
  package pkg do
    action :install
  end
end

# Example with specific options for different platforms
package 'net-tools' do
  action :install
  case node['platform_family']
  when 'rhel', 'fedora'
    package_name 'net-tools'
  when 'debian'
    package_name 'net-tools'
  when 'suse'
    package_name 'net-tools'
  end
end