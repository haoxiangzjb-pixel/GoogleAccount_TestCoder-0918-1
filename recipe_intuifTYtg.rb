#
# Cookbook:: default
# Recipe:: install_nginx
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Install the nginx package
package 'nginx' do
  action :install
end

# Start and enable the nginx service
service 'nginx' do
  action [:start, :enable]
end