require 'rails_helper'
RSpec.describe Item, type: :model do
  describe 'realtionships' do
    it { should belong_to :merchant }
  end
end
