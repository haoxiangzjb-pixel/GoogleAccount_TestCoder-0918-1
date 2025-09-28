#
# Cookbook Name:: my_cookbook
# Recipe:: create_user
#
# This recipe creates a user account.

# Define the user resource
user 'new_user' do
  comment 'A new user account created by Chef'
  uid 1234
  gid 'users'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$some_encrypted_password_hash' # Use an actual encrypted password hash in production
  action [:create, :manage]
end

# Ensure the user's home directory exists (Chef usually handles this, but good to be explicit if needed)
directory '/home/new_user' do
  owner 'new_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end
