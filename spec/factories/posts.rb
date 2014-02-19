# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title { [Faker::Company.name, Faker::Commerce.product_name].join(', ') }
    body {Faker::Lorem.sentences(5).join(', ')}
    price {rand(1..1000)}
    size {Size.first || create(:size) }
    status_enum 0
    cached_votes_total {rand(1..1000)}
    cached_votes_score {rand(1..1000)}
    cached_votes_up    {rand(1..1000)}
    cached_votes_down  {rand(1..1000)}
    impressions_count  {rand(1..1000)}
 
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
