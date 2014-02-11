require 'spec_helper'

describe SessionsController do
  describe 'GET #new' do
    it 'should be visible to everyone'
    it 'should not login someone without a valid account'
    it 'should login someone with a valid account'
  end
end