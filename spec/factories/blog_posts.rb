# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog_post do
    title             {Faker::Company.catch_phrase}
    content           {Faker::Lorem.sentences(4).join(',')}
    content_html      {Faker::Lorem.sentences(4).join(',')}
    content_html_raw  {Faker::Lorem.sentences(4).join(',')}
    sequence(:identifier) {|n| n+10001 }
    sequence(:token)      {|n| "#{n}mystring#{n}"}
  end
end
