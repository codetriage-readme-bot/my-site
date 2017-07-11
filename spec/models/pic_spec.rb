require 'rails_helper'

RSpec.describe Pic, type: :model do
  
  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
    it { should belong_to(:user) }
  end

end
