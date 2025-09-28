# Recipe for installing a sample package (e.g., curl)
# This is a basic example of a Chef recipe.

package 'curl' do
  action :install
end