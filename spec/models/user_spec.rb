require 'spec_helper'

describe User do
  describe 'validations' do
  end

  describe 'associations' do 
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_one(:keychain).dependent(:destroy) }
  end
end
