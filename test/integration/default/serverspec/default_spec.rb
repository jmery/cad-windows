require 'spec_helper'

describe 'sitedbaas-windows::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe windows_feature('IIS-WebServerRole') do
    it { should be_installed }
  end

  describe service('World Wide Web Publishing Service') do
    it { should be_running }
    it { should have_start_mode('Automatic') }
  end

  describe iis_website('Default Web Site') do
    it { should exist }
    it { should be_enabled }
    it { should be_running }
    it { should be_in_app_pool('DefaultAppPool') }
  end

end
