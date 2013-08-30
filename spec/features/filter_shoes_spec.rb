require 'spec_helper'

describe 'Filtered Pairs' do 
  %w(top bottom oldest newest).each do |sort|
    %w(all sml med lrg xl).each do |filter|
      it "should be visible sorting: #{sort}, and filtering: #{filter}" do 
        target_path = "/pairs/" + sort + "/" + filter
        visit target_path
        expect(current_path).to eq target_path 
      end

      it "should show sold pairs sorting: #{sort}, and filtering: #{filter}" do 
        target_path = "/pairs/sold/" + sort + "/" + filter
        visit target_path
        expect(current_path).to eq target_path 
      end
    end
  end
end
