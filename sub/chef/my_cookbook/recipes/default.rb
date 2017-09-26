#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

directory "/home/pault/mybin" do
  owner 'pault'
  group 'pault'
  mode '0755'
  action :create
end

cookbook_file "/home/pault/mybin/k" do
  mode "0755"
end

cookbook_file "/home/pault/mybin/kk" do
  mode "0755"
end

cookbook_file "/home/pault/mybin/t" do
  mode "0755"
end

cookbook_file "/home/pault/mybin/exe" do
  mode "0755"
end

cookbook_file "/home/pault/mybin/pidof_list" do
  source "pidof_list"
  mode "0755"
end

cookbook_file "/home/pault/mybin/faxw" do
	source "faxw"
	mode "0755"
end

cookbook_file "/home/pault/mybin/l" do
  source "l"
  mode "0755"
end

