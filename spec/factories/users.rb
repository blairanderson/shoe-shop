# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{Faker::Company.catch_phrase.split.join("_")}#{n}"}
    sequence(:email)    { |n| "email+#{n}.#{Faker::Internet.email}" }
    password 'password'
  end

  factory :admin, class: User do
    user_name  "blair"
    email "blair81@gmail.com"
    password "password"
  end
end
