require 'spec_helper'

describe 'Python' do

  describe file('/usr/bin/python') do
    it { should be_file }
    it { should exist }
  end

  describe file('/usr/local/bin/python3.6') do
    it { should be_file }
    it { should exist }
  end

  describe file('/usr/bin/python2.7') do
    it { should be_file }
    it { should exist }
  end

  describe file('/usr/bin/pip') do
    it { should be_file }
    it { should exist }
  end

  describe file('/usr/bin/pip3') do
    it { should be_file }
    it { should exist }
  end
end