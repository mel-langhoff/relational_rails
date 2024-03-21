require 'rails_helper'

RSpec.describe Album do 
  describe 'relationships' do
    it { should belong_to :artist }
  end
end