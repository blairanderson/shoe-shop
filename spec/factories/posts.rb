# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user
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
      after(:create) do |instance|
        instance.images << create_list(:image, 2)
        instance.update(status_enum: Post.statuses[:for_sale])
      end
    end
    
    trait :sold do
      status_enum Post.statuses[:sold]
    end
    
    trait :deleted do
      status_enum Post.statuses[:deleted]
    end
  end
end
