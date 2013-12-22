require 'spec_helper'

describe Keychain do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
