require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe file("/etc/yum.repos.d/remi.repo") do
  it { should be_file }
  it { should contain "[remi]" }
  it { should contain "enabled=1" }
end
