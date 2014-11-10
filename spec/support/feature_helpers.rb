module FeatureHelpers
  def login_user(user, password="password")
    visit logout_path
    visit login_path
    expect(page).to have_field "user_login"
    fill_in "user_login", with: user.username
    expect(page).to have_field "user_password"
    fill_in "user_password", with: password

    within('#new_user') do
      find('input[type="submit"]').click
    end
  end
end