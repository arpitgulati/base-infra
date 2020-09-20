require 'spec_helper'

describe 'Services' do

  describe service('ntp') do
    it { should be_enabled }
    it { should be_running }
  end

  describe service('newrelic-sysmond') do
    it { should be_running }
  end

  describe service('filebeat') do
    it { should be_running }
  end

  describe service('metricbeat') do
    it { should be_running }
  end

  describe service('packetbeat') do
    it { should be_running }
  end

  describe service('fail2ban') do
    it { should be_running }
  end
end