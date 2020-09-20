require 'spec_helper'

describe 'DirPaths' do

  describe file('/var/log/fynd') do
    it { should be_directory }
  end
end