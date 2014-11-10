require 'spec_helper'

describe 'User Auth' do
  let(:username) { "blair" }
  let(:password) { "password" }
  let(:email) { "example@example.com" }
  before :each do
    valid_user = FactoryGirl.create(:user, username: username, password: password, email: email)
    expect(valid_user).to be_valid
    expect(valid_user).to be_confirmed
    visit login_path
  end

  describe 'valid credentials' do
    it 'user can login on home screen' do
      expect(page).to have_field "Email or Username"
      expect(page).to have_field "Password"
      within('#new_user') do
        fill_in "Email or Username", with: email
        fill_in "Password", with: password
        find('input[type="submit"]').click
      end
      expect(page).to have_content "Logout"
    end
  end

  describe 'invalid credentials' do
    it 'user cannot login' do
      within('#new_user') do
        fill_in "Email or Username", with: email
        fill_in "Password", with: password + "654"
        find('input[type="submit"]').click
      end
      expect(page).to have_content "Login or Create Account"
    end
  end
end
