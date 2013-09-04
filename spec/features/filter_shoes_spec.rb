require 'spec_helper'

describe 'Filtered Pairs' do 
  %w(top bottom oldest newest).each do |sort|
    %w(all sml med lrg xl).each do |filter|
      it "should be visible sorting: #{sort}, and filtering: #{filter}" do 
        visit filters_path(sort, filter)
        expect(current_path).to eq filters_path(sort, filter) 
      end

      it "should show sold pairs sorting: #{sort}, and filtering: #{filter}" do 
        visit sold_filters_path(sort, filter)
        expect(current_path).to eq sold_filters_path(sort, filter) 
      end
    end
  end
end
