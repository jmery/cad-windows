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

require 'spec_helper'

describe 'test::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
