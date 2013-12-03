# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "Jordans and shit"
    body Faker::Lorem.sentences(3).join
    price 100
    size {Size.first || create(:size) }
    status_enum 0
    user
 
    trait :for_sale do
      status_enum 1
    end
    
    trait :sold do
      status_enum 2
    end
    
    trait :deleted do
      status_enum 3
    end
  end
end
