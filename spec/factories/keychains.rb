# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :keychain do
    api_secret "MyString"
    api_token "MyString"
    auth_credential_secret "MyString"
    auth_credential_token "MyString"
    user_id 1
  end
end
