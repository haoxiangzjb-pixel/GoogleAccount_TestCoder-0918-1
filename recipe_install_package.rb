# A Chef recipe to install a package
# This recipe installs the 'curl' package as an example

package 'curl' do
  action :install
end

# Additional example with conditional installation
package 'wget' do
  action :install
  not_if 'which wget'  # Only install if wget is not already present
end

# Example of installing a package with a specific version
# package 'nginx' do
#   version '1.20.1'
#   action :install
# end