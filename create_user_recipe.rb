#
# Cookbook Name:: my_cookbook
# Recipe:: create_user
#
# Copyright (c) 2025 The Authors, All Rights Reserved.
#
# This recipe creates a system user named 'newuser'.

user 'newuser' do
  comment 'A new user account created by Chef'
  uid 1234
  gid 'users'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$hashed_password_example' # This should be a properly hashed password
  action [:create, :manage]
end
