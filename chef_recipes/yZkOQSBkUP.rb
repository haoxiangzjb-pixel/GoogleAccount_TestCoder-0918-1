# Chef recipe to create a user
user 'myuser' do
  comment 'My Test User'
  uid 1001
  gid 1001
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$xyz$wzvyhMS7xDh9JWvQQPlkK/'
  action :create
end