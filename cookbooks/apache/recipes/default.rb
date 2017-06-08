#
# Cookbook:: apache
# Recipe:: default
#

# Copyright:: 2017, The Authors, All Rights Reserved.
if node ['platform_family'] == 'rhel'
	package ="httpd"
elsif node ['platfomr_family'] == "debian"
	package ="apache2"
end
#install apache package
package 'httpd' do
	package_name package
	action :install
end

#start the httpd
service 'httpd' do
	service_name package
	action [:start, :enable]
end

#include_recipe 'apache::websites'
