# Chef recipe to create a user

user 'myuser' do
  comment 'My User'
  uid 1234
  gid 'users'
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$hashedpassword$example'  # This should be a properly hashed password
  action [:create, :manage]
end

# Ensure the user's home directory exists
directory '/home/myuser' do
  owner 'myuser'
  group 'users'
  mode '0755'
  action :create
  recursive true
end