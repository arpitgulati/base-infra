require 'spec_helper'

describe 'Locales' do

  describe package('locales') do
    it { should be_installed }
  end
end