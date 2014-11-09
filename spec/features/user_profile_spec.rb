require 'spec_helper'

describe "UsersFeatures" do
  before do
    @user = FactoryGirl.create(:user, username: 'tomtomtom', password: 'password' )
    FactoryGirl.create(:post, user: @user)
    FactoryGirl.create(:post, :for_sale ,user: @user)
    FactoryGirl.create(:post, :sold ,user: @user)
    FactoryGirl.create(:post, :deleted ,user: @user)
    visit login_path
    expect(page).to have_field "user_login"
    expect(page).to have_field "user_password"

    fill_in "user_login", with: @user.username
    fill_in "user_password", with: 'password'
    within '#new_user' do
      page.find('input[type="submit"]').click
    end
  end
  
  it 'can manage their account' do
    visit user_path(@user)
    expect(page).to have_content @user.username
    
    by 'logging in, profile should exist' do
      visit profile_path
      expect(page).to have_content @user.username
    end

    and_by "clicking 'update password'" do
      visit profile_path
      click_link t('user.update.password')
      expect(page).to have_content "Edit User"
    end
  end
end