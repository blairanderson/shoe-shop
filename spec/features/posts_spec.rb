require 'spec_helper'

describe 'posting' do
  let(:valid_user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, :for_sale, user: valid_user) }

  def login(user, password = "password")
    visit logout_path
    visit login_path
    expect(page).to have_field "username"
    fill_in "username", with: user.username
    expect(page).to have_field "password"
    fill_in "password", with: password
    within('#new_user') do
      find('input[type="submit"]').click
    end
  end

  def create_valid_post
    visit new_post_path
    expect(current_path).to eq new_post_path

    expect(page).to have_field 'post_title'
    fill_in 'post_title', with: "Jordans and shit"

    expect(page).to have_field 'post_size_id'
    select(Size.last.name, from: 'Size')

    expect(page).to have_field 'post_price'
    fill_in 'post_price', with: "150"

    expect(page).to have_field 'post_body'
    fill_in 'post_body', with: "These are the slickest jordans around"
    Post.any_instance.stub(:send_notifications).and_return(true)
    page.find("[type='submit']").click
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

    it 'should not see posts without images' do
      Post.destroy_all
      visit root_path
      expect( page ).to have_content "No posts found"

      and_by "creating a post with an image" do
        Post.destroy_all
        expect(Post.count).to eq 0

        @pair_of_shoes = FactoryGirl.create(:post, :for_sale)
        visit root_path

        expect( page ).to have_content "Displaying 1 post"
        expect( Post.count ).to eq 1
      end

      and_by "removing the image, should remove the post" do
        Post.first.images.destroy_all
        visit root_path
        expect( page ).to have_content "No posts found"
        expect( Post.count ).to eq 1
      end
    end
  end


  context 'an authenticated user' do
    describe 'editing images should be able to' do
      it 'add an image to one of their posts'
      it 'remove an image from one of their posts'
      it 'admin can remove images from posts'
    end

    describe 'changing post status' do
      it 'should be able to view a post with status' do
        login(valid_user)
        visit post_path(post)
        expect(post.status_enum).to eq 1
        Post.statuses.each do |_k,v|
          post.update(status_enum: v)
          visit post_path(post)
          expect(page).to have_content(post.title)
        end
      end
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
      let(:post) { FactoryGirl.create(:post) }
      it 'after trying to create a post' do
        visit new_post_path
        expect(current_path).to eq login_path
      end
      it 'after trying to visit the edit page' do
        visit edit_post_path(post)
        expect(current_path).to eq login_path
      end
    end
  end
end
