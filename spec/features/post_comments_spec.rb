require 'spec_helper'

describe 'Commenting on a Post' do 
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, user: user) }
  let!(:another_user) {FactoryGirl.create(:user) }
  describe 'an authenticated user' do 

    before :each do 
      visit root_path
      login_user(another_user)
      visit root_path
      expect(page).to have_content "Login successful."
    end

    xit 'should be able to submit a comment' do
      visit post_path(post)
      expect(current_path).to eq post_path(post)

      comment_body = Faker::Lorem.sentences(5).join
      
      fill_in 'comment[body]', with: comment_body
      click_button "submit"
      expect(page).to have_content comment_body
    end
  end

end
