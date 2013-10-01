require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user, username: 'tomtomtom', password: 'password' )
    FactoryGirl.create(:post, user: @user)
    FactoryGirl.create(:post, :for_sale ,user: @user)
    FactoryGirl.create(:post, :sold ,user: @user)
    FactoryGirl.create(:post, :deleted ,user: @user)
  end
  
   def login(user, password = "password")
    visit root_path
    expect(page).to have_field "username"
    fill_in "username", with: user.username
    expect(page).to have_field "password"
    fill_in "password", with: password
    click_on "Login"
  end
  
  it 'profile path should not have errors' do
    login @user
    visit profile_path
    expect(page).to have_content @user.username
  end
  
  it 'user show should not have errors' do
    login @user
    visit user_path(@user)
    expect(page).to have_content @user.username
  end
  
end