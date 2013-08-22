require 'spec_helper'

describe PagesController do
  describe 'GET about' do 
    it 'should be success' do 
      get :about
      expect(response).to be_success
    end
  end

  describe 'GET tos' do 
    it 'should be success' do
      get :tos
      expect(response).to be_success
    end
  end

  describe 'GET privacy_policy' do 
    it 'should be success' do
      get :privacy_policy
      expect(response).to be_success
    end
  end
end
