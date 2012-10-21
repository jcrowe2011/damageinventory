class AddQtyToProductStore < ActiveRecord::Migration
  def change
    add_column :product_stores, :qty, :integer
  end
end
