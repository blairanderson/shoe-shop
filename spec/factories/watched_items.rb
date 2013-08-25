# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :watched_item do
    user
    post
  end
end
