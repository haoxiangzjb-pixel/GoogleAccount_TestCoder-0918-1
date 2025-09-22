# Chef recipe to create a user
# Filename: create_user_UqEta5TyrD.rb

# Create a new user named 'newuser'
user 'newuser' do
  comment 'New User'
  uid 1001
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$xyz$wtfp9GJfJHhFa5HW4N5gU/' # Example encrypted password
  action :create
end

# Create the user's home directory
directory '/home/newuser' do
  owner 'newuser'
  group 'users'
  mode '0755'
  action :create
end