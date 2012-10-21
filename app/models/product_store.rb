class ProductStore < ActiveRecord::Base
	belongs_to :store
	belongs_to :product
  attr_accessible :product_id, :store_id, :qty
 

   def update_inventory
   	product = Product.find(self.product_id)
    unless product.qty == self.qty
      self.qty = product.qty
      self.save!
   end
  end


  def self.update_stock(product_id,store_id,qty)
  	inventory = Inventory.where(:product_id => product_id, :store_id => store_id).first
  	inventory.qty = qty
  	inventory.save!
  	product = Product.find(product_id)
  	product.qty = qty
  	product.save!
  end
end
