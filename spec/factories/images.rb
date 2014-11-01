# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    url { "http://www.fillmurray.com/200/300.jpg" }
    post { Post.first || create(:post) }
  end
end
