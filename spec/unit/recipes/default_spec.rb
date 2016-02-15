#
# Cookbook Name:: sitedbaas-windows
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
require 'spec_helper'

# RSpec.configure do |config|
#   config.platform = 'windows'
#   config.version  = '2012R2'
# end

describe 'sitedbaas-windows::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
      runner.converge(described_recipe)
    end

    it 'runs a powershell_script to install IIS server' do
      expect(chef_run).to run_powershell_script('Install IIS')
    end

    it 'creates a template c:\inetpub\wwwroot\Default.htm' do
      expect(chef_run).to create_template('c:\inetpub\wwwroot\Default.htm')
    end

    it 'starts and enables w3svc' do
      expect(chef_run).to start_service('w3svc')
      expect(chef_run).to enable_service('w3svc')
    end
  end
end
