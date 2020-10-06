FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "TUser#{n}" }
    sequence(:email) { |n| "Test#{n}@example.com" }
    password { "iam-tuser" }
  end
end
