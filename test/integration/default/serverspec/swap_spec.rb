require 'spec_helper'

describe 'SwapFile' do

  describe file('/swapfile') do
    it { should exist }
  end

end