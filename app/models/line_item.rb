class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  belong_to :product
  belong_to :cart
end
