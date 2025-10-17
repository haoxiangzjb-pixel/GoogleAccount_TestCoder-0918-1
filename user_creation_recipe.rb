# Chef recipe to create a user

user 'newuser' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$somehashedpassword' # This should be a properly hashed password
  action :create
end