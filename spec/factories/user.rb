FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password  { Faker::Internet.unique.password(min_length: 20, mix_case: true) }

    trait :authenticated_user do
      after(:create)  do |user|
        user.grant_user_access
      end
    end

    trait :with_default_password do
      after(:create) do |user|
        user.update(password: User::TEST_DEFAULT_PASSWORD)
      end
    end
  end
end
