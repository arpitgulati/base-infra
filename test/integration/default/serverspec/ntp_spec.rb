require 'spec_helper'

describe 'NTP' do
  describe package('ntp') do
    it { should be_installed }
  end

  describe service('ntp') do
    it { should be_running }
  end
end
