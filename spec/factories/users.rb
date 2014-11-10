# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{n}#{(0...8).map { (65 + rand(26)).chr }.join}" }
    sequence(:email)    { |n| "email+#{n}.#{Faker::Internet.email}" }
    password 'password'
    confirmed_at { Time.now }

    trait :with_posts do
      after(:create) do |user|
        user.posts <<  create_list(:post, 2, :for_sale)
      end
    end
  end

  factory :admin, class: User do
    user_name  "blair"
    email ENV["ADMINB"]
    password "password"
  end
end
