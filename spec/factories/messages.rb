FactoryGirl.define do
  factory :message do
    message { Faker::Lorem.sentence }
  end
end
