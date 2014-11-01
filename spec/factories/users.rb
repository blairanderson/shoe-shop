# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{n}#{Faker::Company.catch_phrase.downcase.split.join("_")}"[0, 30] }
    sequence(:email)    { |n| "email+#{n}.#{Faker::Internet.email}" }
    password 'password'
  end

  factory :admin, class: User do
    user_name  "blair"
    email ENV["ADMINB"]
    password "password"
  end
end
