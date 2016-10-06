class Message < ApplicationRecord
  belongs_to :user

  scope :with_users, -> do
    eager_load(:user)
  end
end
