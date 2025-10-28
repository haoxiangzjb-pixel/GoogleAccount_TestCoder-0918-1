# Chef recipe to create a user

user 'random_user' do
  comment 'Random User Account'
  uid 1003
  gid 'users'
  home '/home/random_user'
  shell '/bin/bash'
  action :create
end