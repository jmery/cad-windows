# encoding: utf-8
# copyright: 2015, Chef Software, Inc.
# license: All rights reserved

title 'IIS Windows Profile'

control "iis-1.0" do
  impact 1.0
  title "IIS Should be installed"
  desc "Its a web server"

describe windows_feature('Web-Server') do
  it { should be_installed }
end

describe service('W3SVC') do
    it { should be_running }
    it { should be_enabled }
  end

  describe file ('c:\inetpub\wwwroot\Default.htm') do
    it { should be_file }
  end
  

end
