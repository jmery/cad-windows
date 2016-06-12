#
# Cookbook Name:: sitedbaas-windows
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'iis::default'

template 'c:\inetpub\wwwroot\Default.htm' do
  source 'Default.htm.erb'
  rights :read, 'Everyone'
end

windows_zipfile 'c:\\inetpub\\wwwroot\\' do
  source 'https://s3.amazonaws.com/iis-demo/webfiles.zip'
  action :unzip
  not_if { ::File.exist?('c:\inetpub\wwwroot\favicon.ico') }
end

service 'w3svc' do
  action [:enable, :start]
end
