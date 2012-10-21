class Inventory < ProductStore
	 def self.model_name
    Product.model_name
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