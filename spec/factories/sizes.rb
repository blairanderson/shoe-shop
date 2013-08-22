# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :size do
    sequence(:name) {|n| "#{n}" }
  end
end
