require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'associations' do
    it 'should have one user' do
      user_with_messages = FactoryGirl.create :user_with_messages
      message = Message.last
      expect(message).to be
      expect(message.user).to be
    end
  end
end
