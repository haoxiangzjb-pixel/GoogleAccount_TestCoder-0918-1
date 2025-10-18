# Chef Recipe to Install a Package
#
# This recipe installs a package using the package resource

# Install the curl package
package 'curl' do
  action :install
end

# Example of installing multiple packages
%w[git vim nano].each do |pkg|
  package pkg do
    action :install
  end
end

# You can also specify a package version
# package 'nginx' do
#   version '1.14.0'
#   action :install
# end

# Notify service to restart if package is updated
package 'apache2' do
  action :install
  notifies :restart, 'service[apache2]', :delayed
end

# Conditional installation based on platform
if platform?('ubuntu', 'debian')
  package 'apt-transport-https' do
    action :install
  end
elsif platform?('redhat', 'centos', 'fedora')
  package 'epel-release' do
    action :install
  end
end