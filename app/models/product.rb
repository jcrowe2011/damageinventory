class Product < ActiveRecord::Base
	has_many :product_stores
	has_many :stores, :through => :product_stores

  attr_accessible :name, :type, :color, :size, :qty

  before_save :capitalize_name

  def update_inventory(store_id)
    if self.product_stores.find_by_store_id(store_id).qty != self.qty
      self.product_stores.find_by_store_id(store_id).update_attribute(:qty,self.qty)
    end
  end



  def capitalize_name
    self.name = self.name.capitalize
  end

  def color_sku
    self.color.gsub(/a|e|i|o|u|\s|-/i, "").upcase
  end

  def name_sku
    self.name.gsub(/a|e|i|o|u|\s|-/i, "").upcase
  end

  def size_sku
    self.size.gsub(/a|e|i|o|u|\s|/i, "").upcase
  end

  def get_sku
  	self.name_sku + self.color_sku + self.size_sku
  end


end
