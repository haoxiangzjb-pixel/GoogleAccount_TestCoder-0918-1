user "testuser" do
  comment "A test user"
  home "/home/testuser"
  shell "/bin/bash"
  # Note: Setting a password is complex and often done via other means in production.
  # This example creates the user without a specific password.
  action :create
end