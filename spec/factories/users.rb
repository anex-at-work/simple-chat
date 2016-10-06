FactoryGirl.define do
  factory :user do
    nickname { Faker::Internet.user_name }

    factory :user_with_messages do
      transient do
        posts_count 3
      end

      after :create do |user, evaluator|
        create_list :message, evaluator.posts_count, user: user
      end
    end
  end
end
