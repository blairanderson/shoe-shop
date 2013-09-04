class PaypalCallback < ActiveRecord::Base
  serialize :response, Hash  
end
