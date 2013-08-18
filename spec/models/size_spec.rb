require 'spec_helper'

describe Size do
  
  describe 'validations' do 
    it {should validate_uniqueness_of :name}
    it {should validate_presence_of :name}
  end

  describe 'associations' do 
    it { should have_many(:posts) }
  end
end
