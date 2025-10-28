# Chef recipe to create a user

user 'newuser' do
  comment 'New User Account'
  uid 1001
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$hashedpassword$example'  # This should be a properly hashed password
  action [:create, :manage]
end

# Create the user's home directory
directory '/home/newuser' do
  owner 'newuser'
  group 'users'
  mode '0755'
  action :create
  recursive true
end