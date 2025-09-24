# Recipe to install a package using Chef
# This recipe installs the 'vim' package

package 'vim' do
  action :install
end
