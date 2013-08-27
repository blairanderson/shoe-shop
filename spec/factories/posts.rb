# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    brand "NIKE"
    title "Jordans and shit"
    body Faker::Lorem.sentences(3).join
    price 100
    size {Size.first || create(:size) }
    status :draft
    user
  end
end
