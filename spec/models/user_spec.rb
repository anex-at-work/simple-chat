require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it 'should have many messages' do
      user_with_messages = FactoryGirl.create :user_with_messages
      expect(user_with_messages).to be
      expect(user_with_messages.messages.count).to be > 0
    end
  end
end
