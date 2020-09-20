require 'spec_helper'

describe 'TimeZone' do

  describe package('tzdata') do
    it { should be_installed }
  end
end
