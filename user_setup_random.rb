# Chef recipe to create a user with random naming

user 'demo_user' do
  comment 'Demo User for Testing'
  uid 1002
  gid 'users'
  home '/home/demo_user'
  shell '/bin/bash'
  manage_home true
  action :create
end

# Set up user's SSH directory
directory '/home/demo_user/.ssh' do
  owner 'demo_user'
  group 'demo_user'
  mode '0700'
  action :create
end

# Add an authorized keys file
file '/home/demo_user/.ssh/authorized_keys' do
  owner 'demo_user'
  group 'demo_user'
  mode '0600'
  content ''
  action :create
end