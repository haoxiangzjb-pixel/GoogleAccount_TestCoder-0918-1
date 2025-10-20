# Chef Recipe to Install a Package
#
# This recipe installs a package using the package resource

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

# You can also specify a package version
# package 'nginx' do
#   version '1.14.0'
#   action :install
# end

# Notify another resource if the package installation changes
package 'apache2' do
  action :install
  notifies :restart, 'service[apache2]', :delayed
end

# Example service resource that might be notified
service 'apache2' do
  action :nothing
end