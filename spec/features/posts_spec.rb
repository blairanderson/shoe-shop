require 'spec_helper'

describe 'posting' do 
  let(:valid_user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post, user: valid_user) }

  def login(user, password = "password")
    visit logout_path
    visit login_path
    expect(page).to have_field "username"
    fill_in "username", with: user.username
    expect(page).to have_field "password"
    fill_in "password", with: password
    find('input[type="submit"]').click
  end

  def create_valid_post
    visit new_post_path
    expect(current_path).to eq new_post_path

    expect(page).to have_field 'post_title'
    fill_in 'post_title', with: "Jordans and shit"

    expect(page).to have_field 'post_size_id'
    select(Size.last.name, :from => 'Size')

    expect(page).to have_field 'post_price'
    fill_in 'post_price', with: "150"

    expect(page).to have_field 'post_body'
    fill_in 'post_body', with: "These are the slickest jordans around"

    click_on "Submit"
  end

  describe 'un-authenticated user' do 
    it 'should not be able to create a post' do 
      visit new_post_path
      expect( page ).to have_content "Login or Create Account"
    end

    it 'should not be able to edit another users posting' do 
      expect( post.user.id ).to eq valid_user.id
      
      next_valid_user = FactoryGirl.create(:user)
      login(next_valid_user)
      expect(page).to have_content "Logout"

      visit edit_post_path(post)
      expect( current_path ).to eq new_sessions_path
      expect( page ).to have_content "You are not authorized"
    end
  end


  context 'an authenticated user' do
    describe 'should be able to edit their posts' do 

    end
  end

  context 'a visitor that is un-authenticated' do
    describe 'should be able to visit' do 
      it 'a single post' do
        visit post_path(post)
        expect(current_path).to eq post_path(post)
      end

      it 'the login page' do 
        visit login_path
        expect( current_path ).to eq login_path
      end

      it 'the registration page' do 
        visit new_user_path
        expect(current_path).to eq new_user_path
      end

      it 'the about page' do 
        visit about_path
        expect(current_path).to eq about_path
      end

      it 'the TOS' do 
        visit tos_path
        expect(current_path).to eq tos_path
      end

      it 'the Privacy Policy' do 
        visit privacy_policy_path
        expect(current_path).to eq privacy_policy_path
      end
    end

    describe 'should be returned to the home page' do 
      let(:post) { Post.first }
      it 'after trying to create a post' do 
        visit new_post_path
        expect(current_path).to eq login_path
      end
      it 'after trying to visit the edit page' do
        visit edit_post_path(post)
        expect(current_path).to eq login_path
      end

      it 'after trying to upvote a post' do
        visit upvote_post_path(post)
        expect(current_path).to eq login_path
      end

      it 'after trying to downvote a post' do 
        visit downvote_post_path(post)
        expect(current_path).to eq login_path
      end
    end
  end
end
