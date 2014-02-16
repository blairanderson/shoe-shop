require 'spec_helper'

describe BlogPost do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
