require 'spec_helper'

describe 'posting' do 
  before do 
    Size.create(name: "20")
  end

  let!(:valid_user) {FactoryGirl.create(:user)}
  let!(:next_valid_user) {FactoryGirl.create(:user)}


  def login(user, password = "password")
    visit root_path
    expect(page).to have_field "username"
    fill_in "username", with: user.username
    expect(page).to have_field "password"
    fill_in "password", with: password
    click_on "Login"
  end

  def create_valid_post
    visit new_post_path
    expect(current_path).to eq new_post_path

    expect(page).to have_field 'post_brand'
    fill_in 'post_brand', with: "NIKE"

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
  
  describe 'valid logged in user' do 
    before :each do 
      visit root_path
      login(valid_user)
      expect(page).to have_content "Logout"
    end

    it 'should be able to create a post' do 
      visit new_post_path
      
      create_valid_post

      target_post = Post.last
      expect(Post.count).to eq 1
      expect(current_path).to eq post_path(target_post)
      expect(target_post.user.id).to eq valid_user.id
    end

    it 'should be able to edit their own posts' do 
      visit new_post_path

      create_valid_post

      target_post = Post.first
      expect( target_post.user.id ).to eq valid_user.id

      visit edit_post_path(target_post)
      fill_in 'post_price', with: "250"
      click_on 'Submit'

      expect( current_path ).to eq post_path(target_post)
      expect( page ).to have_content  "250"
    end
  end

  describe 'un-authenticated user' do 
    let(:post) {FactoryGirl.create(:post)}
    let(:valid_user) { post.user }
    
    it 'should not be able to create a post' do 
      visit new_post_path
      expect( page ).to have_content "Login or Create Account"
    end

    it 'should not be able to edit another users posting' do 
      target_post = Post.first
      expect( target_post.user.id ).to eq valid_user.id
      
      login(next_valid_user)
      expect(page).to have_content "Logout"

      visit edit_post_path(target_post)
      expect( current_path ).to eq new_sessions_path
      expect( page ).to have_content "You are not authorized"
    end
  end
end
