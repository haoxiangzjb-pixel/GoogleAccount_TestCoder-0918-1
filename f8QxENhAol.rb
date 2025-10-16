# Chef recipe to create a user

user 'example_user' do
  comment 'Example User'
  uid 1001
  gid 'users'
  home '/home/example_user'
  shell '/bin/bash'
  password '$1$hashedpassword$example'  # This should be a properly hashed password
  action [:create, :manage]
end